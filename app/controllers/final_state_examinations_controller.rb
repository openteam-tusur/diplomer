# encoding: utf-8

class FinalStateExaminationsController < CrudController
  belongs_to :diploma, :singleton => true
  respond_to :html
  layout :false, :only => [:show, :edit]

  actions :all, :except => :index

  def show
    @final_state_examination = FinalStateExamination.where(:diploma_id => params[:diploma_id]).first
  end
end
