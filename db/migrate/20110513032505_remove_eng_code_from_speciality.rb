class RemoveEngCodeFromSpeciality < ActiveRecord::Migration
  def self.up
    remove_column :specialities, :eng_code
    add_column :specialities, :eng_qualification, :string
  end

  def self.down
    remove_column :specialities, :eng_qualification
    add_column :specialities, :eng_code
  end
end
