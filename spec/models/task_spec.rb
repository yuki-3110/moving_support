require 'rails_helper'
describe 'タスクモデルのバリデーションテスト', type: :model do
  it 'タスクのタイトルが空の場合、バリデーションにひっかかる' do
    task = Task.new(title: '', content: 'テスト', deadline: '1か月前まで')
    expect(task).not_to be_valid
  end
  it 'タスクのタイトルが101字以上の場合、バリデーションにひっかかる' do
    task = Task.new(title: 'a' * 101, content: 'テスト', deadline: '1か月前まで')
    expect(task).not_to be_valid
  end
  it 'タスクの期日が空の場合、バリデーションにひっかかる' do
    task = Task.new(title: 'テスト', content: 'テスト', deadline: '')
    expect(task).not_to be_valid
  end
end