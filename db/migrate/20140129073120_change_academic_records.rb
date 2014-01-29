class ChangeAcademicRecords < ActiveRecord::Migration
  def self.up
    rename_column :academic_records, :issued_on, :issue_date
    rename_column :academic_records, :produced_on, :admission_date
  end

  def self.down
  end
end
