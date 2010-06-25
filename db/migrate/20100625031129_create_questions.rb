class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.integer :instrument_id
      t.integer :variable_id
      t.integer :regexp_id
      t.text :conditional
      t.timestamps
    end
  end
  
  def self.down
    drop_table :questions
  end
end
