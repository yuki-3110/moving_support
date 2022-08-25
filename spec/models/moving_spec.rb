require 'rails_helper'
describe 'ムービングモデルのバリデーションテスト', type: :model do
  let!(:user) { FactoryBot.create(:user) }
  it '引越日が空の場合、バリデーションにひっかかる' do
    moving = Moving.new(moving_day: '', user: user)
    expect(moving).not_to be_valid
  end
  it '引越日が入力されている場合、バリデーションに通る' do
    moving = Moving.new(moving_day: '2022-10-05', user: user)
    expect(moving).to be_valid
  end
end