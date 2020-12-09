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
      expect(@user.errors.full_messages).to include("Email @を含めて入力してください")
    end 
    it "emailに@がないと登録できない"do
      @user.email = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email @を含めて入力してください")
    end
    it "emailが重複すると登録できない" do
      another = FactoryBot.build(:user)
      another.save
      @user.email = another.email
      @user.valid?
      expect(@user.errors.full_messages).to include("Email has already been taken")
    end
    it "passwordが空だと登録できない" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが英語のみだと登録できない" do
      @user.password = "aaaaaa"
      @user.password_confirmation = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end
    it "passwordが数字のみだと登録できない" do
      @user.password = "111111"
      @user.password_confirmation = "111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end
    it "passwordが全角だと登録できない" do
      @user.password = "Ａ１Ａ１Ａ１"
      @user.password_confirmation = "Ａ１Ａ１Ａ１"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end
    it "passwordが６文字以下だと登録できない" do
      @user.password = "1234a"
      @user.password_confirmation = "1234a"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordとpassword_confirmationが一致しないと登録できない" do
      @user.password = "12345a"
      @user.password_confirmation = "123456a"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "first_nameが空だと登録できない" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "first_nameが漢字・平仮名・カタカナ以外では登録できない" do
      @user.first_name = "Mark"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
    end
    it "last_nameが空だと登録できない" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "last_nameが漢字・平仮名・カタカナ以外では登録できない" do
      @user.last_name = "Lee"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
    end
    it "first_name_kが空だと登録できない" do
      @user.first_name_k = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name k can't be blank")
    end
    it "first_name_kが全角カタカナ以外では登録できない" do
      @user.first_name_k = Gimei.first.kanji
      @user.valid?
      expect(@user.errors.full_messages).to include("First name k 全角カナを使用してください")
    end
    it "last_name_kが空だと登録できない" do
      @user.last_name_k = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name k can't be blank")
    end
    it "last_name_kが全角カタカナ以外では登録できない" do
      @user.last_name_k = Gimei.last.kanji
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name k 全角カナを使用してください")
    end
    it "birthが空だと登録できない" do
      @user.birth = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth 生年月日を入力してください")
    end
  end
end

# bundle exec rspec spec/models/user_spec.rb 