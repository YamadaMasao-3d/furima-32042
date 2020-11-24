require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録情報の保存' do
    context '新規登録がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@user).to be_valid
      end
      it "nicknameが入力されていれば登録できる" do
        @user.nickname = "aaaaaa"
        expect(@user).to be_valid
      end
      it "emailが入力されていれば登録できる" do
        @user.email = "fallon.krajcik@yahoo.com"
        expect(@user).to be_valid
      end
      it "passwordが6文字以上の半角英数字であれば登録できる" do
        @user.password = "00000a"
        @user.password_confirmation = "00000a"
        expect(@user).to be_valid
      end
      it 'last_nameが入力されていれば登録出来る' do
        @user.last_name = "和速水"
        expect(@user).to be_valid
      end
      it 'first_nameが入力されていれば登録出来る' do
        @user.first_name = "琥珀主"
        expect(@user).to be_valid
      end
      it 'last_name_kanaが入力されていれば登録出来る' do
        @user.last_name_kana = "ニギハヤミ"
        expect(@user).to be_valid
      end
      it 'first_name_kanaが入力されていれば登録出来る' do
        @user.first_name_kana = "コハクヌシ"
        expect(@user).to be_valid
      end
      it 'birthdayが入力されていれば登録出来る' do
        @user.birthday = "1958-06-11"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailは＠がないと登録できない" do
        @user.email = "fallon.krajcikyahoo.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが英字だけでは登録できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが数字だけでは登録できない" do
        @user.password = "111111"
        @user.password_confirmation = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "last_nameが半角だと登録できない" do
        @user.last_name = "nigihayami"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
      end
      it "first_nameが半角だと登録できない" do
        @user.first_name = "kohakunushi"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
      end
      it "last_name_kanaが空だと登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "first_name_kanaが空だと登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "last_name_kanaが全角片仮名でないと登録できない" do
        @user.last_name_kana = "にぎはやみ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters.")
      end
      it "first_name_kanaが全角片仮名でないと登録できない" do
        @user.first_name_kana = "琥珀主"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters.")
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end