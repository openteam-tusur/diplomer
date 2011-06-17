# encoding: utf-8

class CoursesController < CrudController
  belongs_to :context, :polymorphic => true
  respond_to :html
  layout :false, :only => [:show, :edit]

  actions :all

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

