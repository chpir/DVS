class AddCodeIdToRules < ActiveRecord::Migration
  def self.up
    add_column :rules, :code_id, :integer
    remove_column :rules, :rule
  end

  def self.down
    remove_column :rules, :code_id
    add_column :rules, :rule, :text
  end
end
