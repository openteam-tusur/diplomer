# encoding: utf-8

class FinalQualificationProjectsController < CrudController
  belongs_to :diploma, :singleton => true
  respond_to :html
  layout :false, :only => [:show, :edit]

  actions :all, :except => :index

  def show
    @final_qualification_project = FinalQualificationProject.where(:diploma_id => params[:diploma_id]).first
    render :partial => 'final_qualification_projects/final_qualification_project', :locals => { :final_qualification_project => @final_qualification_project }
  end
end
