class ExceptionValue < ActiveRecord::Base
  belongs_to :exception
  belongs_to :variable
end
