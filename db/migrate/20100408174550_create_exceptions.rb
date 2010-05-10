class CreateExceptions < ActiveRecord::Migration
  def self.up
    create_table :exceptions do |t|
      t.integer :rule_id
      t.string :rule_type
      t.text :note

      t.timestamps
      
    end
  end

  def self.down
    drop_table :exceptions
  end
end
