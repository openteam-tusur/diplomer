# encoding: utf-8

class PapersController < CrudController
  belongs_to :diploma

  actions :all, :except => :show

  def index
    @papers = Paper.where(:diploma_id => params[:diploma_id])
  end
end
