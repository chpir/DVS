class CreateMemberVariableTypes < ActiveRecord::Migration
  def self.up
    create_table :member_variable_types do |t|
      t.string :name
      t.text :description

      t.timestamps
      
    end
  end

  def self.down
    drop_table :member_variable_types
  end
end
