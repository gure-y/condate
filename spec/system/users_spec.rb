require 'rails_helper'

RSpec.describe "ユーザーログイン機能", type: :system do
  it 'ログインに成功し、トップページに遷移する' do
    # あらかじめ、ユーザーをDBに保存する
    @user = FactoryBot.create(:user)

    # ログインページへ移動する
    visit new_user_session_path

    # すでに保存されているユーザーのemailとpasswordを入力する
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password

    # ログインボタンをクリックする
    click_on("ログインする")

    # トップページに遷移していることを確認する
    expect(current_path).to eq root_path

  end
  
  it 'ログインに失敗し、再びログインページに戻ってくる' do
    # 予め、ユーザーをDBに保存する
    @user = FactoryBot.create(:user)

    # ログインページへ移動する
    visit new_user_session_path

    # 誤ったユーザー情報を入力する
    fill_in 'user_email', with: "test"
    fill_in 'user_password', with: "test"

    # ログインボタンをクリックする
    click_on("ログインする")

    # ログインページに戻ってきていることを確認する
    expect(current_path).to eq new_user_session_path
  end

end
