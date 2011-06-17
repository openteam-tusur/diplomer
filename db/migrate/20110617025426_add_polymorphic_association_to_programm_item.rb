class AddPolymorphicAssociationToProgrammItem < ActiveRecord::Migration
  def self.up
    rename_column :programm_items, :diploma_id, :context_id
    add_column :programm_items, :context_type, :string
  end

  def self.down
    rename_column :programm_items, :context_id, :diploma_id
    remove_column :programm_items, :context_type
  end
end

