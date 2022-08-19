class CreateHaveToTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :have_to_tasks do |t|
      t.boolean :done, default: false
      t.references :moving, null: false, foreign_key: true
      t.references :task, null: false, foreign_key: true

      t.timestamps
    end
  end
end
