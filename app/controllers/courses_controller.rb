# encoding: utf-8

class CoursesController < CrudController
  actions :all

  belongs_to :diploma, :speciality, :academic_record, :optional => true

  custom_actions :collection => :sort

  layout :false, :only => [:show, :edit]

  respond_to :html

  def update
    @course = Course.find(params[:id])

    @course.update_attributes params[:course]

    render :partial => 'courses/course', :locals => { :course => @course } and return
  end

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

  def sort
    sort! {
      # NOTE: используется params[:programm_item]
      # потому что не хочется менять имя параметра где-то в видах или JS
      @academic_record.sort_courses(params[:programm_item])
      render :nothing => true and return
    }
  end
end

