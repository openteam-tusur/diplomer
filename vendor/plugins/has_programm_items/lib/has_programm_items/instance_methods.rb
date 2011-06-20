module HasProgrammItems::InstanceMethods
  def sort_program_items(item_ids)
    item_ids.each_with_index do |item_id, index|
      self.programm_items.find(item_id).update_attribute(:position, index+1)
    end
  end
end

