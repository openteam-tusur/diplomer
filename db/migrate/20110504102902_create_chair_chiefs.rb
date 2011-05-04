class CreateChairChiefs < ActiveRecord::Migration
  def self.up
    create_table :chair_chiefs do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :chair_chiefs
  end
end
