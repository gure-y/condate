require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context "ユーザーの新規登録ができる時" do
    it "nameとemail、passwordとpassword_confirmationが存在する時登録できる" do
      expect(@user).to be_valid
    end

    it 'emailは@を含んでいる時登録できる' do
      @user.email = 'condate@condate'
      expect(@user).to be_valid
    end

    it "passwordが8文字以上であれば登録できる" do
      @user.password = "1234abcd"
      @user.password_confirmation = "1234abcd"
      expect(@user).to be_valid
    end
  end

  context "ユーザーの新規登録ができない時" do
    it "nameが空では登録できない" do
      @user.name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("お名前を入力してください")
    end

    it "emailが空では登録できない" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end

    it "emailに@が含まれていない時登録できない" do
      @user.email = "condate.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールは不正な値です")
    end

    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
    end

    it "passwordが空では登録できない" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end
    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end

    it "passwordが7文字以下だと登録できない" do
      @user.password = "abc123"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは8文字以上で入力してください")
    end

    it "passwordが半角英字のみだと登録できない" do
      @user.password = "abcdefgh"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは不正な値です")
    end

    it "passwordが半角数字のみだと登録できない" do
      @user.password = "12345678"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは不正な値です")
    end

    it "passwordが全角英数字だと登録できない" do
      @user.password = "ｑｗｒｔｙ１２３"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは不正な値です")
    end
  end
end
