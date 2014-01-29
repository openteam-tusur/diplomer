class AddProducedOnToAcademicRecords < ActiveRecord::Migration
  def self.up
    add_column :academic_records, :produced_on, :date
  end

  def self.down
    remove_column :academic_records, :produced_on
  end
end
