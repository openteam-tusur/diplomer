class ChangeDictionaryTableName < ActiveRecord::Migration
  def self.up
    rename_table :dictionaries, :disciplines
  end

  def self.down
    rename_table :disciplines, :dictionaries
  end
end
