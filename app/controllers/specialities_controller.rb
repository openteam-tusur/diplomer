# encoding: utf-8

class SpecialitiesController < CrudController
  actions :all

  def show
    show!{
      @course = @speciality.courses.new
      @paper = @speciality.papers.new
      @practice = @speciality.practices.new
    }
  end
end

