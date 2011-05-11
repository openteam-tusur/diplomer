class ChangeDictionary < ActiveRecord::Migration
  def self.up
    rename_column :dictionaries, :type, :kind
  end

  def self.down
    rename_column :dictionaries, :kind, :type
  end
end
