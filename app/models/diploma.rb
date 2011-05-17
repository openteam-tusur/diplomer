# encoding: utf-8

class Diploma < ActiveRecord::Base
  belongs_to :speciality
  belongs_to :chair

  has_many :courses, :dependent => :destroy
  has_many :papers, :dependent => :destroy
  has_many :practices, :dependent => :destroy

  has_one :final_qualification_project, :dependent => :destroy
  has_one :final_state_examination, :dependent => :destroy
  has_one :student, :dependent => :destroy

  validates_presence_of :speciality, :admission_date, :graduation_date,
                        :study_form, :total_hours, :contact_hours

  accepts_nested_attributes_for :student, :update_only => true

  after_create :create_final_qualification_project
  after_create :create_final_state_examination

  before_create :generate_number

  has_autosuggest_for :speciality

  has_enum :study_form, %w[fulltime parttime postal]

  def to_s
    "Диплом №#{number}"
  end

  private
    def generate_number
      diplomas = self.class.where(:graduation_date => (self.graduation_date.at_beginning_of_year..self.graduation_date.at_end_of_year),
                                  :chair_id => self.chair.id)

      number = diplomas.last ? diplomas.last.serial_number + 1 : 1
      formatted_number = sprintf("%05i",number)

      self.eng_number = "#{chair.eng_abbr.upcase}#{I18n.l graduation_date, :format => '%y'}-#{formatted_number}"
      self.number = "#{chair.abbr.upcase}#{I18n.l graduation_date, :format => '%y'}-#{formatted_number}"
    end
end




# == Schema Information
#
# Table name: diplomas
#
#  id              :integer         not null, primary key
#  speciality_id   :integer
#  number          :string(255)
#  admission_date  :date
#  graduation_date :date
#  study_form      :string(255)
#  study_duration  :string(255)
#  total_hours     :integer
#  contact_hours   :integer
#  created_at      :datetime
#  updated_at      :datetime
#  chair_id        :integer
#  eng_number      :string(255)
#

