# encoding: utf-8

require 'spec_helper'

describe ProgrammItem do
  it "должен создавать дисциплину если она не найдена" do
    diploma = Factory.create :diploma
    diploma.courses.create! Factory(:course, :discipline_term => 'Математика')
    course = diploma.courses.first

    course.discipline.should eql Discipline.first
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

