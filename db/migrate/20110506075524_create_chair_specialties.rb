class CreateChairSpecialties < ActiveRecord::Migration
  def self.up
    create_table :chair_specialties do |t|
      t.integer :chair_id
      t.integer :specialty_id

      t.timestamps
    end
  end

  def self.down
    drop_table :chair_specialties
  end
end
