class CreateMemberVariables < ActiveRecord::Migration
  def self.up
    create_table :member_variables do |t|
      t.integer :rule_id
      t.integer :variable_id
      t.integer :member_variable_type_id

      t.timestamps
      
    end
  end

  def self.down
    drop_table :member_variables
  end
end
