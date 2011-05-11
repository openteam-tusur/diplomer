class AddTitleAndEngTitleToProgrammItem < ActiveRecord::Migration
  def self.up
    add_column :programm_items, :title, :string
    add_column :programm_items, :eng_title, :string
  end

  def self.down
    remove_column :programm_items, :eng_title
    remove_column :programm_items, :title
  end
end
