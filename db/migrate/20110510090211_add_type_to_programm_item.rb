class AddTypeToProgrammItem < ActiveRecord::Migration
  def self.up
    add_column :programm_items, :type, :string
  end

  def self.down
    remove_column :programm_items, :type
  end
end
