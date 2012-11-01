# encoding: utf-8

class Faculty < ActiveRecord::Base
  has_many :academic_records
  has_many :chairs
  has_many :diplomas

  has_one :role

  validates_presence_of :title, :abbr, :chief_name, :chief_post

  default_scope :order => 'title ASC'

  has_translate

  protected_parent_of :academic_records
  protected_parent_of :chairs
  protected_parent_of :diplomas

  searchable do
    boolean :translated
  end

  alias_attribute :to_s, :title

  alias :term :to_s
end

# == Schema Information
#
# Table name: faculties
#
#  id         :integer          not null, primary key
#  title      :text
#  eng_title  :text
#  abbr       :string(255)
#  eng_abbr   :string(255)
#  created_at :datetime
#  updated_at :datetime
#  chief_post :string(255)
#  chief_name :string(255)
#

