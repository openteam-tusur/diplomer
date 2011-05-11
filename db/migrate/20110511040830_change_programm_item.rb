class ChangeProgrammItem < ActiveRecord::Migration
  def self.up
    rename_column :programm_items, :dictionary_id, :discipline_id
  end

  def self.down
    rename_column :programm_items, :discipline_id, :dictionary_id
  end
end
