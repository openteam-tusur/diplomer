class ValidMigration < ActiveRecord::Migration
  def self.up
    rename_column :academic_records, :issue_date, :issued_on
    rename_column :academic_records, :admission_date, :produced_on
  end

  def self.down
    rename_column :academic_records, :produced_on, :admission_date
    rename_column :academic_records, :issued_on, :issue_date
  end
end
