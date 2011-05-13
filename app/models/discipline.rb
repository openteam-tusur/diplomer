# encoding: utf-8

class Discipline < ActiveRecord::Base
  validates_presence_of :title

  def to_s
    title
  end

  searchable do
    text :term
  end

  alias :term :to_s
end




# == Schema Information
#
# Table name: disciplines
#
#  id         :integer         not null, primary key
#  title      :text
#  eng_title  :text
#  created_at :datetime
#  updated_at :datetime
#

