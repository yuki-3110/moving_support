FactoryBot.define do
  factory :user do
    # moving_id { FactoryBot.create(:moving) } 
    name { 'test_user_01' }
    # email { 'test_user_01@test.com' }
    sequence(:email) { |n| "user_#{n}@example.com" }
    password { '11111111' }
    password_confirmation { '11111111' }
    admin { false }
    # association :moving
  end
end