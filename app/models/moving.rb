class Moving < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  validates :moving_day,  presence: true
end
