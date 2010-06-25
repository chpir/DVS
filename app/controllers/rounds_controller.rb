class RoundsController < ApplicationController
  active_scaffold :round do |config|
    config.columns = [:name, :project]
  end
end
