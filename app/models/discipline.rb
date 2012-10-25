# encoding: utf-8

class Discipline < ActiveRecord::Base
  default_scope :order => 'title ASC'

  has_many :programm_items

  has_translate

  protected_parent_of :diplomas

  validates_presence_of :title

  searchable do
    text :term
  end

  alias_attribute :to_s, :title

  alias :term :to_s

  def diplomas
    programm_items.map(&:diploma)
  end
end

# == Schema Information
#
# Table name: disciplines
#
#  id         :integer          not null, primary key
#  title      :text
#  eng_title  :text
#  created_at :datetime
#  updated_at :datetime
#

