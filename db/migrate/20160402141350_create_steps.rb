class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :address
      t.string :title
      t.datetime :scheduled_at
      t.integer :position

      t.timestamps null: false
    end
  end
end
