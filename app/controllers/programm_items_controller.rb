# encoding: utf-8

class ProgrammItemsController < CrudController

  belongs_to :diploma, :speciality, :optional => true

#  actions :all, :only => []

  custom_actions :collection => :sort

  def sort
    index! do
      parent.sort_program_items(params[:programm_item])
      render :nothing => true and return
    end
#    @programm_items = Diploma.find(params[:diploma_id]).courses
#    @programm_items.each do |programm_item|
#      programm_item.position = params['programm_item'].index(programm_item.id.to_s) + 1
#      programm_item.save(:validate => false)
#    end
  end
end

