class DatabasesController < ApplicationController
    active_scaffold :database do |config|
      config.columns = [:name, :description, :site_variable, :project]
    end
end
