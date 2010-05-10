class CreateTables < ActiveRecord::Migration
  def self.up
    create_table :tables do |t|
      t.string :name
      t.integer :database_id
      t.integer :table_type_id
      t.text :description
      t.timestamps
	
    end
  end

  def self.down
    drop_table :tables
  end
end
