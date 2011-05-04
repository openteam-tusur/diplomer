class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string :lname
      t.string :fname
      t.string :mname
      t.string :eng_lname
      t.string :eng_fname
      t.string :eng_mname

      t.timestamps
    end
  end

  def self.down
    drop_table :people
  end
end
