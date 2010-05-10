class VariableTypesController < ApplicationController
  active_scaffold :variable_types do |config|
    config.columns = [:name, :description]
  end
end
