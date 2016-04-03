class AddCoordinatesToSteps < ActiveRecord::Migration
  def change
    add_column :steps, :latitude, :float
    add_column :steps, :longitude, :float
  end
end
