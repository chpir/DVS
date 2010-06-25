class RenameExceptionsToValidationExceptions < ActiveRecord::Migration
  def self.up
    rename_table :exceptions, :validation_exceptions
    
  end

  def self.down
        rename_table :exceptions, :validation_exceptions
  end
end
