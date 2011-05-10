class AddTypeToDictionary < ActiveRecord::Migration
  def self.up
    add_column :dictionaries, :type, :string
  end

  def self.down
    remove_column :dictionaries, :type
  end
end
