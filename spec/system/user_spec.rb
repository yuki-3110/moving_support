require 'rails_helper'

RSpec.describe 'ユーザー機能のテスト', type: :system do
  describe 'ユーザーの登録機能のテスト' do
    context 'ユーザーが登録がなく、ログインしていない場合' do
      it 'ユーザーが新規登録をすれば、詳細画面に移動する' do
        visit new_user_path
        fill_in 'user_name', with: 'test_user_01'
        fill_in 'user_email', with: 'test_user_01@test.com'
        fill_in 'user_password', with: '12345678'
        fill_in 'user_password_confirmation', with: '12345678'
        click_on 'アカウント登録'
        expect(page).to have_content 'test_user_01'
      end

      

      it '​ログインせずタスク一覧画面に飛ぼうとしたとき、ログイン画面に遷移する​' do
        visit tasks_path
        expect(current_path).to eq new_session_path
      end 
    end
  end