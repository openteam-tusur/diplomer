# encoding: utf-8

class FinalStateExaminationsController < CrudController
  actions :all

  belongs_to :diploma, :speciality, :optional => true

  layout :false, :only => [:show, :edit]

  respond_to :html

  def show
    show! do
      render :partial => 'final_state_examinations/final_state_examination', :locals => {:final_state_examination => resource} and return
    end
  end

  def destroy
    destroy!{
      render :nothing => true and return
    }
  end
end

