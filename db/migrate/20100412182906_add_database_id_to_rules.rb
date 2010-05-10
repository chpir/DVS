class AddDatabaseIdToRules < ActiveRecord::Migration
  def self.up
    add_column :rules, :database_id, :integer
  end

  def self.down
    remove_column :rules, :database_id
  end
end
