require 'rails_helper'

RSpec.describe "Users", type: :system do
  it '正しいタイトルが表示されていること' do
    visit '/users/new'
    expect(page).to have_title("ユーザー新規登録 | デスク色彩診断"), 'ユーザー登録ページのタイトルに「ユーザー新規登録 | デスク色彩診断」が含まれていません。'
  end

  # context '入力情報正常系' do
  #   it 'ユーザーが新規作成できること' do
  #     visit '/users/new'
  #     expect {
  #       fill_in '姓', with: 'らんてっく'
  #       fill_in '名', with: 'たろう'
  #       fill_in 'メールアドレス', with: 'example@example.com'
  #       fill_in 'パスワード', with: '12345678'
  #       fill_in 'パスワード確認', with: '12345678'
  #       click_button '登録'
  #       Capybara.assert_current_path("/", ignore_query: true)
  #     }.to change { User.count }.by(1)
  #     expect(page).to have_content('ユーザー登録が完了しました'), 'フラッシュメッセージ「ユーザー登録が完了しました」が表示されていません'
  #   end
  # end

  # context '入力情報異常系' do
  #   it 'ユーザーが新規作成できない' do
  #     visit '/users/new'
  #     expect {
  #       fill_in 'メールアドレス', with: 'example@example.com'
  #       click_button '登録'
  #     }.to change { User.count }.by(0)
  #     expect(page).to have_content('ユーザー登録に失敗しました'), 'フラッシュメッセージ「ユーザー登録に失敗しました」が表示されていません'
  #     expect(page).to have_content('姓を入力してください'), 'エラーメッセージ「姓を入力してください」が表示されていません'
  #     expect(page).to have_content('名を入力してください'), 'フラッシュメッセージ「名を入力してください」が表示されていません'
  #     expect(page).to have_content('パスワードは3文字以上で入力してください'), 'フラッシュメッセージ「パスワードは3文字以上で入力してください」が表示されていません'
  #   end
  # end
end
