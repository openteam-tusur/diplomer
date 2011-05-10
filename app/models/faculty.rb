# encoding: utf-8

class Faculty < ActiveRecord::Base
  has_one :role
  has_many :chairs
end


# == Schema Information
#
# Table name: faculties
#
#  id         :integer         not null, primary key
#  title      :text
#  eng_title  :text
#  abbr       :string(255)
#  eng_abbr   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

