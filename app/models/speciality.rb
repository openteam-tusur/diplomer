# encoding: utf-8

class Speciality < ActiveRecord::Base
  has_many :chair_specialities
  has_many :chairs, :through => :chair_specialities
  has_many :diplomas
end




# == Schema Information
#
# Table name: specialities
#
#  id                     :integer         not null, primary key
#  code                   :string(255)
#  eng_code               :string(255)
#  title                  :text
#  eng_title              :text
#  start_recruitment_year :string(255)
#  end_recruitment_year   :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  qualification          :string(255)
#

