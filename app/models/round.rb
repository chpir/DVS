class Round < ActiveRecord::Base
  belongs_to :project
  has_many :instruments
end
