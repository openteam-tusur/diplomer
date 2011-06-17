# encoding: utf-8

class Paper < ProgrammItem
  validates_presence_of :grade, :if => Proc.new { |c| c.context.is_a?(Diploma) }

  delegate :title, :eng_title, :to => :discipline

  before_validation :create_discipline_if_necessury

  has_autosuggest_for :discipline


  def to_s
    "#{title} #{human_grade}"
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

