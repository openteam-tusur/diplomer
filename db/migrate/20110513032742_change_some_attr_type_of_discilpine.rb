class ChangeSomeAttrTypeOfDiscilpine < ActiveRecord::Migration
  def self.up
    change_column :disciplines, :eng_title, :text
    change_column :disciplines, :title, :text
  end

  def self.down
    change_column :disciplines, :title, :string
    change_column :disciplines, :eng_title, :string
  end
end
