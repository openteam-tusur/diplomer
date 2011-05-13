class RestoreProgrammItemTitles < ActiveRecord::Migration
  def self.up
    add_column :programm_items, :title, :text
    add_column :programm_items, :eng_title, :text
  end

  def self.down
    remove_column :programm_items, :title
    remove_column :programm_items, :eng_title
  end
end
