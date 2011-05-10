class CreateDiplomas < ActiveRecord::Migration
  def self.up
    create_table :diplomas do |t|
      t.references :specialty
      t.string :number
      t.date :admission_date
      t.date :graduation_date
      t.string :study_form
      t.string :study_duration
      t.integer :total_hours
      t.integer :contact_hours

      t.timestamps
    end
  end

  def self.down
    drop_table :diplomas
  end
end
