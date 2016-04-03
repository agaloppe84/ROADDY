class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :adress
      t.string :title
      t.datetime :scheduled_at
      t.string :category
      t.integer :position

      t.timestamps null: false
    end
  end
end
