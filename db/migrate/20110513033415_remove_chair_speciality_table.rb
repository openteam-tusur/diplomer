class RemoveChairSpecialityTable < ActiveRecord::Migration
  def self.up
    drop_table :chair_specialities
  end

  def self.down
    create_table :chair_specialities do |t|
      t.integer :chair_id
      t.integer :speciality_id
    end
  end
end
