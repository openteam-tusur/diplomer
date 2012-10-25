class CreateSemesters < ActiveRecord::Migration
  def self.up
    create_table :semesters do |t|
      t.references :academic_record
      t.string :year
      t.string :kind

      t.timestamps
    end
  end

  def self.down
    drop_table :semesters
  end
end
