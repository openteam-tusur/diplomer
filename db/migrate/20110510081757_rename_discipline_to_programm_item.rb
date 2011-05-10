class RenameDisciplineToProgrammItem < ActiveRecord::Migration
  def self.up
    rename_table :disciplines, :programm_items
  end

  def self.down
    rename_table :programm_items, :disciplines
  end
end
