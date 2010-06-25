class Database < ActiveRecord::Base
  belongs_to :project
  has_many :tables, :order => :name
  has_many :rules
end
