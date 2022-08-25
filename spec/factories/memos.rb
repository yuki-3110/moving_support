FactoryBot.define do
  factory :memo do
    # user { FactoryBot.create(:user) }
    # task { FactoryBot.create(:task) }
    content { "'a' * 100" }
    association :user
    association :task
  end
end