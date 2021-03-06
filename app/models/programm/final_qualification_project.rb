# encoding: utf-8

class FinalQualificationProject < ProgrammItem
  validates_presence_of :title, :grade, :credits, :on => :update

  has_translate

  def to_s
    "#{title} #{credits} #{weeks} #{human_grade}"
  end
end

# == Schema Information
#
# Table name: programm_items
#
#  id            :integer          not null, primary key
#  created_at    :datetime
#  updated_at    :datetime
#  grade         :string(255)
#  credits       :float
#  hours         :integer
#  weeks         :integer
#  type          :string(255)
#  discipline_id :integer
#  context_id    :integer
#  title         :text
#  eng_title     :text
#  position      :integer
#  context_type  :string(255)
#  semester_id   :integer
#

