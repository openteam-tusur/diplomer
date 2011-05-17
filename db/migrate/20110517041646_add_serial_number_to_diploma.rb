class AddSerialNumberToDiploma < ActiveRecord::Migration
  def self.up
    add_column :diplomas, :serial_number, :integer
  end

  def self.down
    remove_column :diplomas, :serial_number
  end
end
