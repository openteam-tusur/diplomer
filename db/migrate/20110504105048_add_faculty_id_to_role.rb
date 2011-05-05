class AddFacultyIdToRole < ActiveRecord::Migration
  def self.up
    add_column :roles, :faculty_id, :integer
  end

  def self.down
    remove_column :roles, :faculty_id
  end
end
