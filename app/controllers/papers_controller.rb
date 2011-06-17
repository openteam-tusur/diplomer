# encoding: utf-8

class PapersController < CrudController
  belongs_to :diploma, :speciality, :optional => true
  respond_to :html
  layout :false, :only => [:show, :edit]

  actions :all

  def show
    @paper = Paper.find(params[:id])
    render :partial => 'papers/paper', :locals => { :paper => @paper }
  end

  def destroy
    destroy!{
      render :nothing => true and return
    }
  end
end

