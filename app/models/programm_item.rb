# encoding: utf-8

class ProgrammItem < ActiveRecord::Base
  belongs_to :diploma
  belongs_to :discipline
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

