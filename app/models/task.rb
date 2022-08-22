class Task < ApplicationRecord
  acts_as_list 
  has_many :memos, dependent: :destroy
  belongs_to :movings
  validates :deadline, presence: true
  validates :title,  presence: true, length: { maximum: 100 }
  enum deadline: {'1か月前まで': 1, '14日前まで': 2, '10日前まで': 3, '1週間前まで': 4, '前日まで': 5, '当日': 6, '1週間後まで': 7, '2週間後まで': 8, '1か月後まで': 9}
end
