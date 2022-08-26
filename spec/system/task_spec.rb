require 'rails_helper'
RSpec.describe 'タスク機能のテスト', type: :system do
  # describe '自動生成されたタスクのテスト' do
  #   it '新規登録と引越予定日の入力後、タスクが自動生成されている' do
  #     visit new_user_registration_path
  #     fill_in 'user_name', with: 'test_user_01'
  #     fill_in 'user_email', with: 'test_user_01@test.com'
  #     fill_in 'user_password', with: '12345678'
  #     fill_in 'user_password_confirmation', with: '12345678'
  #     click_on 'アカウント登録'
  #     expect(page).to have_content '引越予定日'
  #     fill_in 'moving_moving_day', with: '002022-10-15'
  #     click_button '設定する'
  #     expect(page).to have_content 'タスク一覧'
  #     click_on 'タスク一覧'
  #     expect(page).to have_content '現在の住まいの管理会社に引越・退去の連絡'
  #   end
  # end

  describe 'タスクのCRUD機能のテスト' do
    before do
      @user = FactoryBot.create(:user)
      @moving = FactoryBot.create(:moving, user: @user)
      @task = FactoryBot.create(:task, moving: @moving)
      visit new_user_session_path
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      click_button 'ログイン'
    end
    it "タスクの新規登録ができる" do
      click_on 'タスクを登録する'
      select "1か月前まで", from: "task_deadline"
      fill_in 'task_title',  with: 'test'
      click_on '登録する'
      expect(page).to have_content 'test'
    end
    it "タスクの詳細を確認できる" do
      click_on 'タスク一覧'
      find('.btn-show').click match: :first
      expect(page).to have_content 'title1'
    end
    it "タスクの編集ができる" do
      click_on 'タスク一覧'
      find('.btn-edit').click match: :first
      fill_in 'task_title', with: '1title'
      click_on '更新する'
      expect(page).to have_content '1title'
    end
    it "タスクの削除ができる" do
      click_on 'タスク一覧'
      find('.btn-destroy').click match: :first
      expect(page.accept_confirm).to eq "本当に消していいですか?"
      expect(page).not_to have_content 'title1'
    end
  end



    # click_link 'タスクを追加する'
    #     fill_in 'task_title',  with: 'task'
    #     fill_in 'task_content',  with: '買い物'
    #     fill_in 'task_deadline',  with: '002022-07-14'
    #     # select "未着手", from: "task_status"
    #     # select "高", from: "task_priority"
    #     find("#task_status").find("option[value='not_yet']").select_option
    #     find("#task_priority").find("option[value='high']").select_option
    #     click_button '登録する'
    #     click_button '登録する'
    #     expect(page).to have_content 'task'
  # end
end