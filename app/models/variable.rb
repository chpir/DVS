class Variable < ActiveRecord::Base
  has_many :exception_values
  belongs_to :table
  belongs_to :variable_type
  has_many :questions
end
