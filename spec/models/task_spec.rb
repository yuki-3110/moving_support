require 'rails_helper'
describe 'タスクモデルのバリデーションテスト', type: :model do
  # let!(:user) { FactoryBot.create(:user) }
  let!(:moving) { FactoryBot.create(:moving) }
  it 'タスクのタイトルが空の場合、バリデーションにひっかかる' do
    task = Task.new(title: '', content: 'テスト', deadline: '1か月前まで', moving: moving)
    expect(task).not_to be_valid
  end
  it 'タスクのタイトルが101字以上の場合、バリデーションにひっかかる' do
    task = Task.new(title: 'a' * 101, content: 'テスト', deadline: '1か月前まで', moving: moving)
    expect(task).not_to be_valid
  end

  
  it 'タスクのタイトルが空ではなく100字以内であれば、バリデーションに通る' do
    # let!(:task) { FactoryBot.create(:task, title: 'title1', content: 'content1', deadline: '1か月前まで') }
    # task = FactoryBot.create(:task, user: user, moving: moving)
    # let!(:user) { FactoryBot.create(:user) }
    # let!(:moving) { FactoryBot.create(:moving) }
    # user = FactoryBot.create(:user)
    # moving = FactoryBot.create(:moving)
    task = Task.new(title: 'a' * 100, content: 'テスト', deadline: '1か月前まで', moving: moving)
    expect(task).to be_valid
  end

  it 'タスクの期日が空の場合、バリデーションにひっかかる' do
    task = Task.new(title: 'テスト', content: 'テスト', deadline: '', moving: moving)
    expect(task).not_to be_valid
  end
  it 'タスクの期日が空ではない場合、バリデーションに通る' do
    task = Task.new(title: 'テスト', content: 'テスト', deadline: '1か月前まで', moving: moving)
    expect(task).to be_valid
  end
end