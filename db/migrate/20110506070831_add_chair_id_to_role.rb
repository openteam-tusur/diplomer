class AddChairIdToRole < ActiveRecord::Migration
  def self.up
    add_column :roles, :chair_id, :integer
  end

  def self.down
    remove_column :roles, :chair_id
  end
end
