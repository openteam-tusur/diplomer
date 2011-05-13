# encoding: utf-8

class Course < ProgrammItem
  validates_presence_of :credits, :hours, :grade, :discipline

  delegate :title, :eng_title, :to => :discipline

  before_validation :create_discipline_if_necessury

  has_autosuggest_for :discipline

  def to_s
    "#{title} #{credits} #{hours} #{grade}"
  end
end








# == Schema Information
#
# Table name: programm_items
#
#  id            :integer         not null, primary key
#  created_at    :datetime
#  updated_at    :datetime
#  grade         :string(255)
#  credits       :float
#  hours         :integer
#  weeks         :integer
#  type          :string(255)
#  discipline_id :integer
#  diploma_id    :integer
#  title         :text
#  eng_title     :text
#

