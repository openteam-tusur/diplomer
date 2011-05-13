# encoding: utf-8

class Speciality < ActiveRecord::Base
  has_many :chair_specialities
  has_many :chairs, :through => :chair_specialities
  has_many :diplomas

  validates_presence_of :code, :title, :eng_title, :start_recruitment_year,
                        :end_recruitment_year, :qualification

  searchable do
    text :term
  end

  def to_s
    "#{code} - #{title} / #{eng_title}"
  end

  alias :term :to_s
end





# == Schema Information
#
# Table name: specialities
#
#  id                     :integer         not null, primary key
#  code                   :string(255)
#  title                  :text
#  eng_title              :text
#  start_recruitment_year :string(255)
#  end_recruitment_year   :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  qualification          :string(255)
#  eng_qualification      :string(255)
#

