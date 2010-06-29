class Question < ActiveRecord::Base
  has_one :project, :through => :instrument
  belongs_to :instrument
  belongs_to :variable
  belongs_to :regularexp
  acts_as_list :scope => :instrument
  
  attr_accessible :instrument_id, :variable_id, :regexp_id, :conditional
  
  validates_presence_of :regularexp
end
