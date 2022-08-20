class AddMovingRefToTasks < ActiveRecord::Migration[6.0]
  def change
    add_reference :tasks, :moving, foreign_key: true
  end
end
