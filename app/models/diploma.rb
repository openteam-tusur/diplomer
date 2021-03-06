# encoding: utf-8

class Diploma < ActiveRecord::Base
  has_programm_items

  belongs_to :chair
  belongs_to :faculty
  belongs_to :speciality

  has_one :final_qualification_project, :dependent => :destroy, :as => :context
  has_one :student,                     :dependent => :destroy, :as => :studentable

  validates_presence_of :speciality, :admission_date, :graduation_date,
                        :study_form, :total_hours, :chair,
                        :access_requirements

  accepts_nested_attributes_for :student, :update_only => true

  after_create :create_final_qualification_project
  after_create :create_program_items

  before_save :generate_number

  has_autosuggest_for :speciality

  default_scope :order => 'number DESC'

  has_enum :study_form, %w[fulltime parttime postal]
  has_enum :access_requirements, %w[bachelor_diploma specialist_diploma certificate_of_complete_secondary_education
                                    certificate_of_professional_education certificate_of_vocational_education]

  delegate :full_info, :to => :student, :prefix => true

  default_value_for :access_requirements, 'certificate_of_complete_secondary_education'

  def is_translated?
    student.is_translated? && final_state_examination.is_translated? && final_qualification_project.is_translated?
  end

  def duration
    result = graduation_date.year - admission_date.year
  end

  def eng_duration
    "#{::I18n.t('duration.eng_year', :count => duration)}"
  end

  def rus_duration
    "#{::I18n.t('duration.year', :count => duration)}"
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
  alias_method :title, :to_s

  def real_faculty
    faculty || chair.faculty
  end

  searchable do
    text :search_string do
      "#{student_surname} #{chair_abbr} #{chair_title} #{I18n.l graduation_date, :format => '%Y'}"
    end
  end

  delegate :surname, :to => :student, :prefix => true
  delegate :abbr, :title, :to => :chair, :prefix => true

  def access_requirements_eng
    I18n.t("activerecord.attributes.#{self.class.name.underscore}.access_requirements_eng.#{access_requirements}")
  end

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
    %w[courses papers practices final_state_examinations].each do |association|
      self.speciality.send(association).each do |item|
        i = item.clone
        i.context = self
        i.save(:validate => false)
      end
    end
  end
end

# == Schema Information
#
# Table name: diplomas
#
#  id                  :integer          not null, primary key
#  speciality_id       :integer
#  number              :string(255)
#  admission_date      :date
#  graduation_date     :date
#  study_form          :string(255)
#  study_duration      :string(255)
#  total_hours         :integer
#  created_at          :datetime
#  updated_at          :datetime
#  chair_id            :integer
#  eng_number          :string(255)
#  serial_number       :integer
#  faculty_id          :integer
#  access_requirements :string(255)
#

