class Project < ActiveRecord::Base
  has_many :databases
  has_many :tables, :through => :databases
  has_many :rules, :through => :databases
  has_many :rounds
  has_many :instruments, :through => :rounds
  has_many :questions, :through => :instruments
end
