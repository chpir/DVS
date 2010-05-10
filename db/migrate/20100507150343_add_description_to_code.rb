class AddDescriptionToCode < ActiveRecord::Migration
  def self.up
    add_column :codes, :description, :text
  end

  def self.down
    remove_column :codes, :description
  end
end
