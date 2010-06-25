class Question < ActiveRecord::Base
  has_one :project, :through => :instrument
  belongs_to :variable
  belongs_to :regularexp
  
  attr_accessible :instrument_id, :variable_id, :regexp_id, :conditional
end
