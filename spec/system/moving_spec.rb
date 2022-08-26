require 'rails_helper'
RSpec.describe '引越予定日の登録・編集テスト', type: :system do
  describe '引越予定日の登録のテスト' do
    before do
      @user = FactoryBot.create(:user)
    end
    it 'アカウント登録後、引越予定日を入力することで、ユーザーの詳細ページに遷移する' do
      visit new_user_session_path
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      click_button 'ログイン'
      expect(page).to have_content '引越予定日'
      fill_in 'moving_moving_day', with: '002022-10-15'
      click_button '設定する'
      expect(current_path).to eq user_path(id: @user.id)
    end
  end
  describe '引越予定日の編集のテスト' do
    before do
      @user = FactoryBot.create(:user)
      @moving = FactoryBot.create(:moving, user: @user)
      visit new_user_session_path
    end
    it 'ユーザーの詳細ページから、引越予定日の編集画面にアクセスし、引越予定日を変更することができる' do
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      click_button 'ログイン'
      expect(current_path).to eq user_path(id: @user.id)
      visit edit_moving_path(id: @moving.id)
      expect(page).to have_content '引越予定日'
      fill_in 'moving_moving_day', with: '002022-10-15'
      click_button '設定する'
      expect(current_path).to eq user_path(id: @user.id)
    end
  end
end