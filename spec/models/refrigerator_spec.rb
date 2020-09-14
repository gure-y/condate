require 'rails_helper'

RSpec.describe Refrigerator, type: :model do
  before do
    @refrigerator = FactoryBot.build(:refrigerator)
  end

  context "メニューが保存できる時" do
    it "cookingとimageが存在する時保存できる" do
      expect(@refrigerator).to be_valid
    end
  end


  context "メニューが保存できない時" do
    it "cookingが存在しない時保存できない" do
      @refrigerator.cooking = nil
      @refrigerator.valid?
      expect(@refrigerator.errors.full_messages).to include("Cookingを入力してください")
    end

    it "imageが存在しない時保存できない" do
      @refrigerator.image = nil
      @refrigerator.valid?
      expect(@refrigerator.errors.full_messages).to include("Imageを入力してください")
    end
  end

end
