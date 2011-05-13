class RemoveTitlesFromProgrammItem < ActiveRecord::Migration
  def self.up
    remove_column :programm_items, :title
    remove_column :programm_items, :eng_title
  end

  def self.down
    add_column :programm_items, :eng_title, :string
    add_column :programm_items, :title, :string
  end
end
