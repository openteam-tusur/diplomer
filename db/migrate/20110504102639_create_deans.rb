class CreateDeans < ActiveRecord::Migration
  def self.up
    create_table :deans do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :deans
  end
end
