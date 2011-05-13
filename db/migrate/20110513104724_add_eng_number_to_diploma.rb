class AddEngNumberToDiploma < ActiveRecord::Migration
  def self.up
    add_column :diplomas, :eng_number, :string
  end

  def self.down
    remove_column :diplomas, :eng_number
  end
end
