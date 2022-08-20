class Memo < ApplicationRecord
  belongs_to :user
  belongs_to :task
  validates :content,  presence: true, length: { maximum: 100 }
end
