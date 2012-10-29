# encoding: utf-8

class AcademicRecord < ActiveRecord::Base
  belongs_to :faculty

  has_many :semesters, :dependent => :destroy
  has_many :courses, :through => :semesters, :before_add => :set_context_type

  has_one :student, :dependent => :destroy, :as => :studentable

  accepts_nested_attributes_for :student, :update_only => true
  accepts_nested_attributes_for :semesters, :reject_if => :all_blank, :allow_destroy => true

  before_create :generate_number

  delegate :surname, :full_info,  :to => :student, :prefix => true
  delegate :abbr, :title,         :to => :faculty, :prefix => true

  searchable do
    text :search_string do
      "#{student_surname} #{faculty_abbr} #{faculty_title} #{I18n.l issued_on, :format => '%Y'}"
    end
  end

  def to_s
    "Академическая справка №#{number}"
  end

  private

  def set_context_type(course)
    course.context_type = 'Semester'
  end

  def generate_number
    academic_records = self.class.where(:issued_on => (Date.today.beginning_of_year..Date.today.end_of_year), :faculty_id => self.faculty)

    if last_academic_record = academic_records.last
      number = last_academic_record.serial_number + 1
    else
      number = 1
    end
    formatted_number = sprintf("%05i",number)

    self.number = "#{faculty.eng_abbr.upcase}#{I18n.l(Date.today, :format => '%y')}-#{formatted_number}"
    self.serial_number = number
  end
end

# == Schema Information
#
# Table name: academic_records
#
#  id            :integer          not null, primary key
#  faculty_id    :integer
#  serial_number :integer
#  number        :string(255)
#  issued_on     :date
#  created_at    :datetime
#  updated_at    :datetime
#

