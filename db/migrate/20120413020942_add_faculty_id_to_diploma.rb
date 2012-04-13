class AddFacultyIdToDiploma < ActiveRecord::Migration
  def self.up
    add_column :diplomas, :faculty_id, :integer
  end

  def self.down
    remove_column :diplomas, :faculty_id
  end
end
