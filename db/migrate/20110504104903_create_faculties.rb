class CreateFaculties < ActiveRecord::Migration
  def self.up
    create_table :faculties do |t|
      t.text :title
      t.text :eng_title
      t.string :abbr
      t.string :eng_abbr

      t.timestamps
    end
  end

  def self.down
    drop_table :faculties
  end
end
