# encoding: utf-8

class PracticesController < CrudController
  belongs_to :diploma, :speciality, :optional => true
  respond_to :html
  layout :false, :only => [:show, :edit]

  actions :all

  def show
    @practice = Practice.find(params[:id])
    render :partial => 'practices/practice', :locals => { :practice => @practice }
  end

  def destroy
    destroy!{
      render :nothing => true and return
    }
  end
end

