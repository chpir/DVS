class CreateTableTypes < ActiveRecord::Migration
  def self.up
    create_table :table_types do |t|
      t.string :name
      t.text :description

      t.timestamps
	
    end
  end

  def self.down
    drop_table :table_types
  end
end
