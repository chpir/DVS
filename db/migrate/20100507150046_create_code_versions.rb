class CreateCodeVersions < ActiveRecord::Migration
  def self.up
    create_table :code_versions do |t|
      t.integer :code_id
      t.text :source
      t.string :tag
      t.text :note

      t.timestamps
    end
  end

  def self.down
    drop_table :code_versions
  end
end
