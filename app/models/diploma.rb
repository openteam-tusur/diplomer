# encoding: utf-8

class Diploma < ActiveRecord::Base
  has_programm_items

  belongs_to :chair
  belongs_to :speciality

  has_one :final_qualification_project, :dependent => :destroy, :as => :context
  has_one :student,                     :dependent => :destroy

  validates_presence_of :speciality, :admission_date, :graduation_date,
                        :study_form, :total_hours, :contact_hours, :chair

  accepts_nested_attributes_for :student, :update_only => true

  after_create :create_final_qualification_project
  after_create :create_program_items

  before_create :generate_number

  has_autosuggest_for :speciality

  default_scope :order => 'number DESC'

  has_enum :study_form, %w[fulltime parttime postal]

  delegate :full_info, :to => :student, :prefix => true


  def is_translated?
    student.is_translated? && final_state_examination.is_translated? && final_qualification_project.is_translated?
  end

  def duration
    result = Date.new(0) + (graduation_date - admission_date)
  end

  def eng_duration
    "#{::I18n.t('duration.eng_year', :count => duration.year)}"
  end

  def rus_duration
    "#{::I18n.t('duration.year', :count => duration.year)}"
  end

  def average_grade
    total = 0.0
    count = 0.0
    total += 3 * programm_items.grade_satisfactorily.count
    count += programm_items.grade_satisfactorily.count
    total += 4 * programm_items.grade_good.count
    count += programm_items.grade_good.count
    total += 5 * programm_items.grade_excellent.count
    count += programm_items.grade_excellent.count
    count > 0 ? (total / count).round(1) : 0
  end

  def to_s
    "Диплом №#{number}"
  end

  searchable do
    text :search_string do
      "#{student_surname} #{chair_abbr} #{chair_title} #{I18n.l graduation_date, :format => '%Y'}"
    end
  end

  delegate :surname, :to => :student, :prefix => true
  delegate :abbr, :title, :to => :chair, :prefix => true

  private
    def generate_number
      diplomas = self.class.where(:graduation_date => (self.graduation_date.at_beginning_of_year..self.graduation_date.at_end_of_year),
                                  :chair_id => self.chair.id)

     if last_diploma = diplomas.first
       number = last_diploma.serial_number + 1
     else
       number = 1
     end
     formatted_number = sprintf("%05i",number)

     self.eng_number = "#{chair.eng_abbr.upcase}#{I18n.l graduation_date, :format => '%y'}-#{formatted_number}"
     self.number = "#{chair.abbr.upcase}#{I18n.l graduation_date, :format => '%y'}-#{formatted_number}"
     self.serial_number = number
    end

    def create_program_items
      %w[courses papers practices].each do |association|
        self.speciality.send(association).each do |item|
          i = item.clone
          i.context = self
          i.save(false)
        end
      end

      if self.speciality.final_state_examination
        self.final_state_examination.attributes = self.speciality.final_state_examination.attributes
        self.final_state_examination.context = self
        self.final_state_examination.save(false)
      end
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
#  serial_number   :integer
#

