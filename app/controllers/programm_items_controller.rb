# encoding: utf-8

class ProgrammItemsController < CrudController
  def sort
    @programm_items = Diploma.find(params[:diploma_id]).courses
    @programm_items.each do |programm_item|
      programm_item.position = params['programm_item'].
                               index(programm_item.id.to_s) + 1
      programm_item.save(:validate => false)
    end
    render :nothing => true
  end
end
