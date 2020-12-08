require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nickname,email,password,first_name,last_name,first_name_k,last_name_k,birthが存在すれば登録できる" do
      expect(@user).to be_valid
    end
    it "nicknameが空だと登録できない" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname ニックネームを入力してください")
    end
    it "emailが空だと登録できない" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end 
    it "emailに@がないと登録できない"do
      @user.email = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "emailが重複すると登録できない" do
      another = FactoryBot.build(:user)
      another.save
      @user.email = another.email
      @user.valid?
      expect(@user.errors.full_messages).to include("Email has already been taken")
    end
    it "passwordが６文字以下だと登録できない" do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordとpassword_confirmationが一致しないと登録できない" do
      @user.password = "123456"
      @user.password_confirmation = "1234567"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "first_nameが空だと登録できない" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "last_nameが空だと登録できない" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "first_name_kが空だと登録できない" do
      @user.first_name_k = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name k can't be blank")
    end
    it "last_name_kが空だと登録できない" do
      @user.last_name_k = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name k can't be blank")
    end
    it "birthが空だと登録できない" do
      @user.birth = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth 生年月日を入力してください")
    end
  end
end