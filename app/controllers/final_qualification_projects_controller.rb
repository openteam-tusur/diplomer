# encoding: utf-8

class FinalQualificationProjectsController < CrudController
  belongs_to :diploma, :singleton => true

  actions :all, :except => :index

  def show
    @final_qualification_project = FinalQualificationProject.where(:diploma_id => params[:diploma_id]).first
  end
end
