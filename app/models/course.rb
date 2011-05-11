# encoding: utf-8

class Course < ProgrammItem
  belongs_to :dictionary_discipline, :foreign_key => :dictionary_id

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
#  dictionary_id :integer
#  diploma_id    :integer
#

