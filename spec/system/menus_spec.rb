require 'rails_helper'

RSpec.describe "メニュー投稿機能", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @menu = FactoryBot.create(:menu)
  end

  context "投稿に失敗した時" do
    it "titleの値が空の時、投稿に失敗する" do
      # ログインする
      log_in(@user)

      # 新規投稿ページへ移動する
      click_on("マイページ")
      click_on("ごはんを記録する")

      # 添付する画像を定義する
      image_path = Rails.root.join('public/images/test_image.png')

      # 画像選択フォームに画像を添付する
      attach_file('menu[image]', image_path)

      # DBに保存されていないことを確認する
      expect{
        click_on("記録する")
      }.not_to change { Menu.count }

      # 元のページに戻ってくることを確認する
      expect(current_path).to eq menus_path
    end

    it "画像が空の時、投稿に失敗する" do
      # ログインする
      log_in(@user)

      # 新規投稿ページへ移動する
      click_on("マイページ")
      click_on("ごはんを記録する")

      # 値をテキストフォームに入力する
      title = "テスト"
      fill_in 'menu_title', with: title

      # DBに保存されていないことを確認する
      expect{
        click_on("記録する")
      }.not_to change { Menu.count }

      # 元のページに戻ってくることを確認する
      expect(current_path).to eq menus_path
    end
  end

  context "投稿に成功する時" do
    it "titleとimageが存在する時、投稿に成功する" do
      # ログインする
      log_in(@user)

      # 新規投稿ページへ移動する
      click_on("マイページ")
      click_on("ごはんを記録する")

      # 添付する画像を定義する
      image_path = Rails.root.join('public/images/test_image.png')

      # 画像選択フォームに画像を添付する
      attach_file('menu[image]', image_path)

      # 値をテキストフォームに入力する
      title = "テスト"
      fill_in 'menu_title', with: title

      # 送信した値がDBに保存されていることを確認する
      expect{
        click_on("記録する")
      }.to change { Menu.count }.by(1)

      # 送信したtitleがブラウザに表示されていることを確認する
      expect(page).to have_content(title)

      # 送信した画像がブラウザに表示されていることを確認する
      expect(page).to have_selector("img")
    end
  end
end
