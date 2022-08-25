FactoryBot.define do
  factory :task do
    title { 'title1' }
    content { 'content1' }
    deadline  { '1か月前まで' }
    moving { FactoryBot.create(:moving) }
  end
end