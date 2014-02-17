# encoding: utf-8

class Semester < ActiveRecord::Base
  belongs_to :academic_record

  has_many :courses, :as => :context

  validates_presence_of :year, :kind

  default_scope order('year, kind')

  has_enum :kind, %w[fall spring]

  def to_s
    "#{human_kind} #{year}"
  end
end

# == Schema Information
#
# Table name: semesters
#
#  id                 :integer          not null, primary key
#  academic_record_id :integer
#  year               :string(255)
#  kind               :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#

