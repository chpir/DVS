class ExceptionValue < ActiveRecord::Base
  belongs_to :validation_exception
  belongs_to :variable
end
