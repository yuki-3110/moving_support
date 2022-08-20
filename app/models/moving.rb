class Moving < ApplicationRecord
  belongs_to :user
  validates :moving_day,  presence: true
end
