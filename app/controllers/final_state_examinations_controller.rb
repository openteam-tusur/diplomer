# encoding: utf-8

class FinalStateExaminationsController < CrudController
  belongs_to :diploma, :singleton => true

  actions :all, :except => :index

  def show
    @final_state_examination = FinalStateExamination.where(:diploma_id => params[:diploma_id]).first
  end
end
