class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :content
      t.integer :deadline, default: 0, null: false
      t.integer :position
      t.integer :question_id

      t.timestamps
    end
  end
end
