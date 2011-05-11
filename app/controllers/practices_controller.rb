# encoding: utf-8

class PracticesController < CrudController
  belongs_to :diploma

  actions :all, :except => :show

  def index
    @practices = Practice.where(:diploma_id => params[:diploma_id])
  end
end
