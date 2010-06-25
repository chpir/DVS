class CreateInstruments < ActiveRecord::Migration
  def self.up
    create_table :instruments do |t|
      t.integer :round_id
      t.string :name
      t.text :description
      t.string :keys
      t.timestamps
    end
  end
  
  def self.down
    drop_table :instruments
  end
end
