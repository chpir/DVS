class CreateRuns < ActiveRecord::Migration
  def self.up
    create_table :runs do |t|
      t.integer :rule_id
      t.string :dataset
      t.integer :number_invalid

      t.timestamps
      
    end
  end

  def self.down
    drop_table :runs
  end
end
