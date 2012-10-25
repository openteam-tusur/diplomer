class CreateAcademicRecords < ActiveRecord::Migration
  def self.up
    create_table :academic_records do |t|
      t.references :faculty
      t.integer :serial_number
      t.string :number
      t.date :issued_on

      t.timestamps
    end
  end

  def self.down
    drop_table :academic_records
  end
end
