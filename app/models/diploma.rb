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
                        :study_form, :study_duration, :total_hours, :contact_hours

  accepts_nested_attributes_for :student, :update_only => true

  after_create :create_final_qualification_project
  after_create :create_final_state_examination

  has_enum :study_form, %w[fulltime parttime postal]

  has_autosuggest_for :speciality

  def to_s
    "Диплом №#{number}"
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
#

