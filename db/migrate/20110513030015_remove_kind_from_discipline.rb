class RemoveKindFromDiscipline < ActiveRecord::Migration
  def self.up
    remove_column :disciplines, :kind
  end

  def self.down
    add_column :disciplines, :kind, :string
  end
end
