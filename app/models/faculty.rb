# encoding: utf-8

class Faculty < ActiveRecord::Base
  has_many :chairs

  has_one :role

  validates_presence_of :title, :abbr

  has_translate

  searchable do
    boolean :translated
  end

  def self.search
    solr_search do
      facet :translated
    end
  end
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

