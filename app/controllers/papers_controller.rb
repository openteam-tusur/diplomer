# encoding: utf-8

class PapersController < CrudController
  belongs_to :diploma, :speciality, :optional => true
  respond_to :html
  layout :false, :only => [:show, :edit]

  actions :all

  def show
    show! do
      render :partial => 'papers/paper', :locals => { :paper => @paper } and return
    end
  end

  def destroy
    destroy!{
      render :nothing => true and return
    }
  end
end

