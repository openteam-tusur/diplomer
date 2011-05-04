class CreateTranslators < ActiveRecord::Migration
  def self.up
    create_table :translators do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :translators
  end
end
