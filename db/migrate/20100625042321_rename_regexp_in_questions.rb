class RenameRegexpInQuestions < ActiveRecord::Migration
  def self.up
    rename_column :questions, :regexp_id, :regularexp_id 
  end

  def self.down
    rename_column :questions, :regularexp_id, :regexp_id
  end
end
