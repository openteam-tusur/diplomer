# encoding: utf-8

class Paper < ProgrammItem
  validates_presence_of :eng_title, :title, :grade

  delegate :title, :eng_title, :to => :discipline

  def to_s
    "#{title} #{grade}"
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
#  title         :string(255)
#  eng_title     :string(255)
#

