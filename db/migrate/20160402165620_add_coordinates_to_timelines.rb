class AddCoordinatesToTimelines < ActiveRecord::Migration
  def change
    add_column :timelines, :latitude, :float
    add_column :timelines, :longitude, :float
  end
end
