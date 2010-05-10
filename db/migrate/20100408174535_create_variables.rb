class CreateVariables < ActiveRecord::Migration
  def self.up
    create_table :variables do |t|
      t.string :name
      t.integer :table_id
      t.integer :variable_type_id
      t.boolean :identifier

      t.timestamps
	
    end
  end

  def self.down
    drop_table :variables
  end
end
