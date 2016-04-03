class AddUserToSteps < ActiveRecord::Migration
  def change
    add_reference :steps, :timeline, index: true, foreign_key: true
  end
end
