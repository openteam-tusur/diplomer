class ChangePerson < ActiveRecord::Migration
  def self.up
    remove_column :people, :eng_fname
    remove_column :people, :eng_lname
    remove_column :people, :eng_mname
    rename_column :people, :fname, :firstname
    rename_column :people, :lname, :surname
    rename_column :people, :mname, :patrynomic
  end

  def self.down
    rename_column :people, :patrynomic, :mname
    rename_column :people, :surname, :lname
    rename_column :people, :firstname, :fname
    add_column :people, :eng_mname
    add_column :people, :eng_lname
    add_column :people, :eng_fname
  end
end
