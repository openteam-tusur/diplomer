# encoding: utf-8

class CoursesController < CrudController
  actions :all

  belongs_to :diploma, :speciality, :optional => true

  layout :false, :only => [:show, :edit]

  respond_to :html

  def show
    @course = Course.find(params[:id])
    render :partial => 'courses/course', :locals => { :course => @course }
  end

  def destroy
    destroy!{
      render :nothing => true and return
    }
  end
end

