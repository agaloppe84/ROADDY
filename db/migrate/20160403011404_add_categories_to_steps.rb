class AddCategoriesToSteps < ActiveRecord::Migration
  def change
    add_reference :steps, :category, index: true, foreign_key: true
  end
end
