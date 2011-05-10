class AddDiplomaToStudent < ActiveRecord::Migration
  def self.up
    change_table :students do |t|
      t.references :diploma
    end
  end

  def self.down
    remove_column :students, :diploma_id
  end
end
