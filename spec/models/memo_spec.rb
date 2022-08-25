require 'rails_helper'
describe 'メモモデルのバリデーションテスト', type: :model do
  let!(:user) { FactoryBot.create(:user) }
  let!(:moving) { FactoryBot.create(:moving) }
  let!(:task) { FactoryBot.create(:task) }
  it 'メモが空の場合、バリデーションにひっかかる' do
    memo = Memo.new(content: '')
    expect(memo).not_to be_valid
  end
  it 'メモが101字以上の場合、バリデーションにひっかかる' do
    memo = Memo.new(content: 'a' * 101)
    expect(memo).not_to be_valid
  end
  it 'タスクのタイトルが空ではなく100字以内であれば、バリデーションに通る' do
    # let!(:user) { FactoryBot.create(:user) }
    # let!(:task) { FactoryBot.create(:task) }
    memo = Memo.new(content: 'a' * 100, user: user, moving: moving, task: task)
    # memo = FactoryBot.create(:memo, user: user, task: task)
    expect(memo).to be_valid
  end
end