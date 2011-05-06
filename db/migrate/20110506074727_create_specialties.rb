class CreateSpecialties < ActiveRecord::Migration
  def self.up
    create_table :specialties do |t|
      t.string :code
      t.string :eng_code
      t.text :title
      t.text :eng_title
      t.string :start_recruitment_year
      t.string :end_recruitment_year

      t.timestamps
    end
  end

  def self.down
    drop_table :specialties
  end
end
