# encoding: utf-8

class Semester < ActiveRecord::Base
  belongs_to :academic_record

  has_many :courses, :as => :context

  validates_presence_of :kind
  validates_presence_of :year, :unless => Proc.new { |s| s.kind_no_matter? }

  default_scope order('year, kind')

  has_enum :kind, %w[fall spring no_matter]

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

