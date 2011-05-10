class ChangeSpecialtyToSpecility < ActiveRecord::Migration
  def self.up
    rename_table :specialties, :specialities
  end

  def self.down
    rename_table :specialities, :specialties
  end
end
