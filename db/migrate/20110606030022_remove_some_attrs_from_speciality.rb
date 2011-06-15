class RemoveSomeAttrsFromSpeciality < ActiveRecord::Migration
  def self.up
    remove_column :specialities, :start_recruitment_year
    remove_column :specialities, :end_recruitment_year
  end

  def self.down
    add_column :specialities, :end_recruitment_year, :string
    add_column :specialities, :start_recruitment_year, :string
  end
end
