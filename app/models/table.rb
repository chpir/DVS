class Table < ActiveRecord::Base
  belongs_to :database
  has_many :variables, :order => :name
  belongs_to :table_type
  has_one :project, :through => :database
end
