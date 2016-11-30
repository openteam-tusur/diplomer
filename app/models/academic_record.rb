# encoding: utf-8

class AcademicRecord < ActiveRecord::Base
  belongs_to :faculty

  has_many :semesters, :dependent => :destroy
  has_many :courses, :through => :semesters, :before_add => :set_context_type

  has_one :student, :dependent => :destroy, :as => :studentable

  accepts_nested_attributes_for :student, :update_only => true
  accepts_nested_attributes_for :semesters, :allow_destroy => true

  before_create :generate_number
  after_create  :create_semester, :if => Proc.new { |ar| ar.semesters.empty? }

  delegate :surname, :full_info,  :to => :student, :prefix => true
  delegate :abbr, :title,         :to => :faculty, :prefix => true

  searchable do
    text :search_string do
      "#{student_surname} #{faculty_abbr} #{faculty_title} #{I18n.l issue_date, :format => '%Y'}"
    end
  end

  def sort_courses(course_ids)
    course_ids.each_with_index do |course_id, index|
      # NOTE: avoid ActiveRecord::ReadOnlyRecord
      Course.where(:id => courses.map(&:id)).find(course_id).update_attribute(:position, index+1)
    end
  end

  def to_s
    "Академическая справка №#{number}"
  end

  def courses_grouped_by_semester
    semester_ids = courses.map(&:context_id).uniq
    ordered_semesters = Semester.where(:id => semester_ids)

    ordered_semesters.inject({}) do |hash, semester|
      hash[semester] = semester.courses.ordered

      hash
    end
  end

  def total_credits
    courses.map(&:credits).sum
  end

  def total_hours
    courses.map(&:hours).compact.sum
  end

  private

  def create_semester
    semesters.create(:kind => :no_matter)
  end

  def set_context_type(course)
    course.context_type = 'Semester'
  end

  def generate_number
    academic_records = self.class.where(:issue_date => (Date.today.beginning_of_year..Date.today.end_of_year), :faculty_id => self.faculty)

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

