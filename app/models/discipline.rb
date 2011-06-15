# encoding: utf-8

class Discipline < ActiveRecord::Base
  has_many :programm_items

  validates_presence_of :title

  def to_s
    title
  end

  has_translate

  protected_parent_of :diplomas

  searchable do
    text :term
  end

  alias :term :to_s

  def diplomas
    programm_items.map(&:diploma)
  end
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

