# encoding: utf-8

class Chair < ActiveRecord::Base
  belongs_to :faculty

  has_one :role

  validates_presence_of :title, :abbr, :faculty

  has_translate

  default_scope :order => 'title ASC'

  def to_s
    "#{title}"
  end
end


# == Schema Information
#
# Table name: chairs
#
#  id         :integer         not null, primary key
#  title      :text
#  abbr       :string(255)
#  eng_title  :text
#  eng_abbr   :string(255)
#  faculty_id :integer
#  created_at :datetime
#  updated_at :datetime
#

