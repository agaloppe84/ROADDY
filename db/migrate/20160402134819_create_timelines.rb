class CreateTimelines < ActiveRecord::Migration
  def change
    create_table :timelines do |t|
      t.string :destination
      t.integer :budget
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps null: false
    end
  end
end
