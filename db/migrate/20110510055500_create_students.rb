class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.string :surname
      t.string :firstname
      t.string :patrynomic
      t.date :birthday
      t.string :code

      t.timestamps
    end
  end

  def self.down
    drop_table :students
  end
end
