# encoding: utf-8

class SpecialitiesController < CrudController
  actions :all

  def show
    show!{
      @course = @speciality.courses.new
      @paper = @speciality.papers.new
      @practice = @speciality.practices.new
      @final_state_examination = @speciality.final_state_examinations.new
    }
  end
end

