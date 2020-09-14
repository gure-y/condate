require 'rails_helper'

RSpec.describe "管理者用機能", type: :system do
  before do
    @refrigerator = FactoryBot.create(:refrigerator)
    @user = FactoryBot.create(:user, admin: true)
  end

  it "管理者のみが管理用ページに移動できる" do
    #ログインページへ移動する
    visit new_user_session_path

    # 管理者ユーザー情報を入力する
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password

    # ログインボタンをクリックする
    click_on("ログインする")

    # トップページに管理者ページへのリンクがあることを確認する
    expect(page).to have_content "メニューを増やす"
  end

  context "管理者がメニューの投稿に失敗する時" do
    it "料理名の値が空の時、投稿に失敗する" do
      # 管理者ユーザーでログインする
      admin_login(@user)
      
      # 管理者ページにアクセスする
      click_on("メニューを増やす")

      # 新規投稿画面へ移動する
      click_on("メニューを増やす")

      # 添付する画像を定義する
      image_path = Rails.root.join('public/images/test_image.png')

      # 画像選択フォームに画像を添付する
      attach_file('refrigerator[image]', image_path)

      # DBに保存されていないことを確認する
      expect{
        click_on("登録する")
      }.not_to change { Refrigerator.count }

      # 元のページに戻ってきていることを確認する
      expect(current_path).to eq administrator_refrigerators_path 
    end

    it "画像が空の時、投稿に失敗する" do
      # 管理者ユーザーでログインする
      admin_login(@user)
      
      # 管理者ページにアクセスする
      click_on("メニューを増やす")
  
      # 新規投稿画面へ移動する
      click_on("メニューを増やす")
  
      # 値をテキストフォームに入力する
      cooking = "テスト"
      fill_in 'refrigerator_cooking', with: cooking

      # DBに保存されていないことを確認する
      expect{
        click_on("登録する")
      }.not_to change { Refrigerator.count }
  
      # 元のページに戻ってきていることを確認する
      expect(current_path).to eq administrator_refrigerators_path 
    end
  end

  context "管理者がメニューの投稿に成功する時" do
    it "料理名と画像が存在している時、投稿に成功する" do
      # 管理者ユーザーでログインする
      admin_login(@user)
      
      # 管理者ページにアクセスする
      click_on("メニューを増やす")
  
      # 新規投稿画面へ移動する
      click_on("メニューを増やす")
  
      # 値をテキストフォームに入力する
      cooking = "テスト"
      fill_in 'refrigerator_cooking', with: cooking

      # 添付する画像を定義する
      image_path = Rails.root.join('public/images/test_image.png')

      # 画像選択フォームに画像を添付する
      attach_file('refrigerator[image]', image_path)

      # 送信した値がDBに保存されていることを確認する
      expect{
        click_on("登録する")
      }.to change { Refrigerator.count }.by(1)

      # 送信したtitleがブラウザに表示されていることを確認する
      expect(page).to have_content(cooking)

      # 送信した画像がブラウザに表示されていることを確認する
      expect(page).to have_selector("img")
    end
  end
end