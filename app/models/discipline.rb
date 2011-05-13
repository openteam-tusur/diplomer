# encoding: utf-8

class Discipline < ActiveRecord::Base
  validates_presence_of :eng_title, :title

  def to_s
    title
  end
end



# == Schema Information
#
# Table name: disciplines
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  eng_title  :string(255)
#  created_at :datetime
#  updated_at :datetime
#  kind       :string(255)
#

