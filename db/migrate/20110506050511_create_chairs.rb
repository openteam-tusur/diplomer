class CreateChairs < ActiveRecord::Migration
  def self.up
    create_table :chairs do |t|
      t.text :title
      t.string :abbr
      t.text :eng_title
      t.string :eng_abbr
      t.integer :faculty_id

      t.timestamps
    end
  end

  def self.down
    drop_table :chairs
  end
end
