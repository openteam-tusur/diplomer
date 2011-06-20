# encoding: utf-8

class CoursesController < CrudController
  actions :all

  belongs_to :diploma, :speciality, :optional => true

  layout :false, :only => [:show, :edit]

  respond_to :html

  def show
    show! do
      render :partial => 'courses/course', :locals => { :course => @course } and return
    end
  end

  def destroy
    destroy!{
      render :nothing => true and return
    }
  end
end

