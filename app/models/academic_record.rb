# encoding: utf-8

class AcademicRecord < ActiveRecord::Base
  belongs_to :faculty

  has_one :student, :dependent => :destroy, :as => :studentable

  accepts_nested_attributes_for :student, :update_only => true

  before_create :generate_number

  def to_s
    "Академическая справка №#{number}"
  end

  private

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
