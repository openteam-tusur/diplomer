class AddQualificationToSpecialty < ActiveRecord::Migration
  def self.up
    add_column :specialties, :qualification, :string
  end

  def self.down
    remove_column :specialties, :qualification
  end
end
