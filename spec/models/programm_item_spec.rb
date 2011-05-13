# encoding: utf-8

require 'spec_helper'

describe ProgrammItem do
  it "должен создавать дисциплину если она не найдена" do
    diploma = Factory.create :diploma
    diploma.courses.create! Factory(:course, :discipline_term => 'Математика')
    course = diploma.courses.first

    course.discipline.should eql Discipline.first
  end

  protected
    def create_discipline_if_necessury
      self.discipline = Discipline.create!(:title => self.discipline_term) unless self.discipline
    end
end
