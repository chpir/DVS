class ValidationException < ActiveRecord::Base
  belongs_to :rule
  has_many :exception_values
end
