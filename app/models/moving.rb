class Moving < ApplicationRecord
  belongs_to :user
  # has_many :tasks, order: position, dependent: :destroy
  has_many :tasks, -> { order(:position) }, dependent: :destroy
  validates :moving_day,  presence: true
end
