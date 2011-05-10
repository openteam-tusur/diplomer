class AddEngFioToStudent < ActiveRecord::Migration
  def self.up
    add_column :students, :eng_surname, :string
    add_column :students, :eng_firstname, :string
    add_column :students, :eng_patrynomic, :string
  end

  def self.down
    remove_column :students, :eng_patrynomic
    remove_column :students, :eng_firstname
    remove_column :students, :eng_surname
  end
end
