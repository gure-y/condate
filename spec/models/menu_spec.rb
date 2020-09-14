require 'rails_helper'

RSpec.describe Menu, type: :model do
  before do
    @menu = FactoryBot.build(:menu)
  end

  context "メニューを投稿できる時" do
    it "titleとimageが存在する時投稿できる" do
      expect(@menu).to be_valid
    end
  end

  context "メニューを投稿できない時" do
    it "titleが空の時投稿できない" do
      @menu.title = nil
      @menu.valid?
      expect(@menu.errors.full_messages).to include("料理名を入力してください")
    end

    it "imageが空の時投稿できない" do
      @menu.image = nil
      @menu.valid?
      expect(@menu.errors.full_messages).to include("画像を入力してください")
    end

    it "userが紐づいていない時投稿は保存できない" do
      @menu.user = nil
      @menu.valid?
      expect(@menu.errors.full_messages).to include("Userを入力してください")
    end

  end
end
