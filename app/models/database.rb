class Database < ActiveRecord::Base
  belongs_to :project
  has_many :tables
  has_many :rules
end
