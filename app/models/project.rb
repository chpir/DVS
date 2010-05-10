class Project < ActiveRecord::Base
  has_many :databases
  has_many :tables, :through => :databases
  has_many :rules, :through => :databases
end
