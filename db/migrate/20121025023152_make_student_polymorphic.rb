class MakeStudentPolymorphic < ActiveRecord::Migration
  def self.up
    rename_column :students, :diploma_id, :studentable_id
    add_column :students, :studentable_type, :string

    Student.update_all(studentable_type: 'Diploma')
  end

  def self.down
    remove_column :students, :studentable_type
    rename_column :students, :studentable_id, :diploma_id
  end
end
