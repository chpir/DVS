class CreateRegularexps < ActiveRecord::Migration
  def self.up
    create_table :regularexps do |t|
      t.string :name
      t.text :rule
      t.text :description
      t.timestamps
    end
  end
  
  def self.down
    drop_table :regularexps
  end
end
