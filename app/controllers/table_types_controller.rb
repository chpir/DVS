class TableTypesController < ApplicationController
      active_scaffold :table_type do |config|
        config.columns = [:name, :description]
      end
end
