class AddSomeAttrToProgrammItem < ActiveRecord::Migration
  def self.up
    add_column :programm_items, :grade, :string
    add_column :programm_items, :credits, :float
    add_column :programm_items, :hours, :integer
    add_column :programm_items, :weeks, :integer
  end

  def self.down
    remove_column :programm_items, :weeks
    remove_column :programm_items, :hours
    remove_column :programm_items, :credits
    remove_column :programm_items, :grade
  end
end
