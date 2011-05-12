# encoding: utf-8

class Diploma < ActiveRecord::Base
  belongs_to :speciality
  has_many :courses
  has_many :papers
  has_many :practices
  has_one  :final_qualification_project
  has_one  :final_state_examination
  has_one  :student

  validates_presence_of :speciality, :admission_date, :graduation_date,
                        :study_form, :study_duration, :total_hours, :contact_hours

  accepts_nested_attributes_for :student, :update_only => true

  after_create :create_final_qualification_project
  after_create :create_final_state_examination

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
#

