FactoryBot.define do
  factory :moving do
    # user { FactoryBot.create(:user) }
    # task { FactoryBot.create(:task) }
    moving_day { "2022-10-05" }
    association :user
  end
end