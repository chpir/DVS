class Regularexp < ActiveRecord::Base
  has_many :questions
  attr_accessible :name, :rule, :description
end
