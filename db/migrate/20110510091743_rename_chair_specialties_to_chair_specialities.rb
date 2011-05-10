class RenameChairSpecialtiesToChairSpecialities < ActiveRecord::Migration
  def self.up
    rename_table :chair_specialties, :chair_specialities
    rename_column :chair_specialities, :specialty_id, :speciality_id
  end

  def self.down
    rename_column :chair_specialities, :speciality_id, :specialty_id
    rename_table :chair_specialities, :chair_specialties
  end
end
