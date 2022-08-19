class Moving < ApplicationRecord
  belongs_to :user
  has_many :have_to_tasks, dependent: :destroy
end
