class AddDoneToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :done, :boolean, default: false
  end
end
