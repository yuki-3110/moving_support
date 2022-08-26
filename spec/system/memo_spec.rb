require 'rails_helper'
RSpec.describe 'メモの登録・削除テスト', type: :system do
  describe 'メモ登録の可否テスト' do
    before do
      @user = FactoryBot.create(:user)
      @moving = FactoryBot.create(:moving, user: @user)
      @task = FactoryBot.create(:task, moving: @moving)
      @memo = FactoryBot.create(:memo, task: @task)
      visit new_user_session_path
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      click_button 'ログイン'
    end
    it 'タスクの詳細ページで、そのタスクにメモを残すことができる' do
      click_on 'タスク一覧'
      find('.btn-show').click match: :first
      fill_in 'memo_content', with: 'メモテスト'
      click_on '保存する'
      expect(page).to have_content 'メモテスト'
    end
    it 'タスクの詳細ページで、保存していたメモを消すことができる' do
      click_on 'タスク一覧'
      find('.btn-destroy').click
      expect(page.accept_confirm).to eq "本当に消していいですか?"
      expect(page).not_to have_content "'a' * 100"
    end
  end
end