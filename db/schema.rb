# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100507223230) do

  create_table "code_versions", :force => true do |t|
    t.integer  "code_id"
    t.text     "source"
    t.string   "tag"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "codes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  create_table "databases", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "project_id"
    t.string   "site_variable"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exception_values", :force => true do |t|
    t.integer  "exception_id"
    t.integer  "variable_id"
    t.text     "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exceptions", :force => true do |t|
    t.integer  "rule_id"
    t.string   "rule_type"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "member_variable_types", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "member_variables", :force => true do |t|
    t.integer  "rule_id"
    t.integer  "variable_id"
    t.integer  "member_variable_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rules", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "tracking"
    t.string   "rule_variable"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "database_id"
    t.integer  "code_id"
  end

  create_table "runs", :force => true do |t|
    t.integer  "rule_id"
    t.string   "dataset"
    t.integer  "number_invalid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "table_types", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tables", :force => true do |t|
    t.string   "name"
    t.integer  "database_id"
    t.integer  "table_type_id"
    t.text     "description"
    t.string   "filename"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",               :null => false
    t.string   "email",               :null => false
    t.string   "crypted_password",    :null => false
    t.string   "password_salt",       :null => false
    t.string   "persistence_token",   :null => false
    t.string   "single_access_token", :null => false
    t.string   "perishable_token",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "variable_types", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "rule"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "variables", :force => true do |t|
    t.string   "name"
    t.integer  "table_id"
    t.integer  "variable_type_id"
    t.boolean  "identifier"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
