# encoding: utf-8

class FinalStateExaminationsController < CrudController
  belongs_to :diploma, :speciality, :optional => true, :singleton => true
  respond_to :html
  layout :false, :only => [:show, :edit]

  actions :all, :except => :index

  def show
    @final_state_examination = FinalStateExamination.where(:diploma_id => params[:diploma_id]).first
    render :partial => 'final_state_examinations/final_state_examination', :locals => { :final_state_examination => @final_state_examination }
  end
end

