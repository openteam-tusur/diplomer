# encoding: utf-8

class Faculty < ActiveRecord::Base
  has_many :chairs

  has_one :role

  validates_presence_of :title, :eng_title, :abbr, :eng_abbr
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

