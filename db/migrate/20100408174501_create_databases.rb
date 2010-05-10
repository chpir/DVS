class CreateDatabases < ActiveRecord::Migration
  def self.up
    create_table :databases do |t|
      t.string :name
      t.text :description
      t.integer :project_id
      t.string :site_variable

      t.timestamps
	
    end
  end

  def self.down
    drop_table :databases
  end
end
