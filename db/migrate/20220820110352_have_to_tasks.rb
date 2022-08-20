class HaveToTasks < ActiveRecord::Migration[6.0]
  def change
    drop_table :have_to_tasks
  end
end
