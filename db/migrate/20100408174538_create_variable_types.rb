class CreateVariableTypes < ActiveRecord::Migration
  def self.up
    create_table :variable_types do |t|
      t.string :name
      t.text :description
      t.text :rule

      t.timestamps
	
    end
  end

  def self.down
    drop_table :variable_types
  end
end
