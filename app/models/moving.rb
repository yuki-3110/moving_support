class Moving < ApplicationRecord
  belongs_to :user
  has_many :have_to_tasks, dependent: :destroy
  has_many :have_to_tasks_task, through: :have_to_tasks, source: :task
end
