class ChangeAttrAtProgrammItem < ActiveRecord::Migration
  def self.up
    remove_column :programm_items, :eng_name
    remove_column :programm_items, :name
    add_column :programm_items, :dictionary_id, :integer
  end

  def self.down
    remove_column :programm_items, :dictionary_id
    add_column :programm_items, :name, :string
    add_column :programm_items, :eng_name, :string
  end
end
