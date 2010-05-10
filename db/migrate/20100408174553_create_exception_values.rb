class CreateExceptionValues < ActiveRecord::Migration
  def self.up
    create_table :exception_values do |t|
      t.integer :exception_id
      t.integer :variable_id
      t.text :value

      t.timestamps
      
    end
  end

  def self.down
    drop_table :exception_values
  end
end
