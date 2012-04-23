# encoding: utf-8

class Speciality < ActiveRecord::Base
  has_many :diplomas

  validates_presence_of :code, :title, :qualification

  default_scope :order => 'title ASC'

  has_translate

  has_programm_items

  searchable do
    text :term
  end

  alias_attribute :to_s, :title

  alias :term :to_s
end






# == Schema Information
#
# Table name: specialities
#
#  id                :integer         not null, primary key
#  code              :string(255)
#  title             :text
#  eng_title         :text
#  created_at        :datetime
#  updated_at        :datetime
#  qualification     :string(255)
#  eng_qualification :string(255)
#

