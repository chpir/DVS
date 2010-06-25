class Instrument < ActiveRecord::Base
  belongs_to :round
  has_one :project, :through => :round
  has_many :questions
  attr_accessible :round_id, :name, :description, :keys
end
