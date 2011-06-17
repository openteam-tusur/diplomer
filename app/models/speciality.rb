# encoding: utf-8

class Speciality < ActiveRecord::Base
  has_many :diplomas

  has_many :courses,       :dependent => :destroy, :as => :context
  has_many :papers,        :dependent => :destroy, :as => :context
  has_many :practices,     :dependent => :destroy, :as => :context


  validates_presence_of :code, :title, :qualification

  has_translate

  searchable do
    text :term
  end

  def to_s
    title
  end

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

