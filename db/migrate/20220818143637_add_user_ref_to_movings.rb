class AddUserRefToMovings < ActiveRecord::Migration[6.0]
  def change
    add_reference :movings, :user, null: false, foreign_key: true
  end
end
