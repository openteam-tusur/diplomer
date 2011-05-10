class ChangeSpeciltyIdToSpecialityId < ActiveRecord::Migration
  def self.up
    rename_column :diplomas, :specialty_id, :speciality_id
  end

  def self.down
    rename_column :diplomas, :speciality_id, :specialty_id
  end
end
