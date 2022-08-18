class CreateMovings < ActiveRecord::Migration[6.0]
  def change
    create_table :movings do |t|
      t.date :moving_day

      t.timestamps
    end
  end
end
