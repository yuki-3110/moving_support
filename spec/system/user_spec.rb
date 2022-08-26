require 'rails_helper'
RSpec.describe 'ユーザー機能のテスト', type: :system do
  describe 'ユーザーのアカウント登録機能のテスト' do
    it '新規登録後、引越予定日入力画面に遷移する' do
      visit new_user_registration_path
      fill_in 'user_name', with: 'test_user_01'
      fill_in 'user_email', with: 'test_user_01@test.com'
      fill_in 'user_password', with: '12345678'
      fill_in 'user_password_confirmation', with: '12345678'
      click_on 'アカウント登録'
      expect(page).to have_content '引越予定日'
    end
  end

  describe 'ユーザーのログイン機能のテスト' do
    context "アカウント登録のみで引越予定日が未登録の場合" do
      before do
        @user = FactoryBot.create(:user)
      end
      it '​ログイン画面よりログインができる​' do
        visit new_user_session_path
        fill_in 'user_email', with: @user.email
        fill_in 'user_password', with: @user.password
        click_button 'ログイン'
        expect(page).to have_content '引越予定日'
      end
    end

    context "アカウントと引越予定日の登録が済んでいる場合" do
      before do
        @user = FactoryBot.create(:user)
        @moving = FactoryBot.create(:moving, user: @user)
      end
      it '​ログイン後、ユーザーの詳細ページへ遷移する​' do
        visit new_user_session_path
        fill_in 'user_email', with: @user.email
        fill_in 'user_password', with: @user.password
        click_button 'ログイン'
        expect(current_path).to eq user_path(id: @user.id)
      end
    end

    context "​ログインせずタスク一覧画面に飛ぼうとした場合" do
      it 'ログイン画面に遷移する​' do
        visit tasks_path
        expect(page).to have_content 'ログイン'
      end
    end

    context "ログイン後、アカウント登録画面にアクセスしようとした場合" do
      before do
        @user = FactoryBot.create(:user)
        @moving = FactoryBot.create(:moving, user: @user)
        visit new_user_session_path
      end
      it "ユーザーの詳細ページにリダイレクトされる" do
        fill_in 'user_email', with: @user.email
        fill_in 'user_password', with: @user.password
        click_button 'ログイン'
        expect(current_path).to eq user_path(id: @user.id)
        visit new_user_registration_path
        expect(page).to have_content 'すでにログインしています。'
      end
    end

    context "ログイン後、ログアウトをした場合" do
      before do
        @user = FactoryBot.create(:user)
        @moving = FactoryBot.create(:moving, user: @user)
        visit new_user_session_path
      end
      it "ログアウトできる" do
        fill_in 'user_email', with: @user.email
        fill_in 'user_password', with: @user.password
        click_button 'ログイン'
        expect(current_path).to eq user_path(id: @user.id)
        click_on "ログアウト"
        expect(page).to have_content "ログアウトしました"
      end
    end
  end
end






