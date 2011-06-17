class AddPositionToProgrammItem < ActiveRecord::Migration
  def self.up
    add_column :programm_items, :position, :integer
  end

  def self.down
    remove_column :programm_items, :position
  end
end
