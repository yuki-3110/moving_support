require 'rails_helper'
describe 'ユーザーモデルのバリデーションテスト', type: :model do
  it '名前の入力欄が空の場合、バリデーションにひっかかる' do
    user = User.new(name: '' , email: 'test@email.com', password: '111111', password_confirmation: '111111')
    expect(user).not_to be_valid
  end
  it '全ての項目が入力されていれば、登録できる' do
    user = User.new(name: 'test' , email: 'test@email.com', password: '111111', password_confirmation: '111111')
    expect(user).to be_valid
  end
end