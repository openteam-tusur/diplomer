class AddChiefPostAndChiefNameToFaculty < ActiveRecord::Migration
  def self.up
    add_column :faculties, :chief_post, :string
    add_column :faculties, :chief_name, :string
  end

  def self.down
    remove_column :faculties, :chief_name
    remove_column :faculties, :chief_post
  end
end
