class AddDiplomaIdToProgrammItem < ActiveRecord::Migration
  def self.up
    add_column :programm_items, :diploma_id, :integer
  end

  def self.down
    remove_column :programm_items, :diploma_id
  end
end
