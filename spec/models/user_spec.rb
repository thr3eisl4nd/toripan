require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do

    context '新規登録できるとき' do
      it 'nickname, email, password, password_confirmation, family_name, first_name, phonenumberが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき'
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'nicknameが全角カナでないと登録できない' do
      @user.nickname = 'ﾌｪｲｶｰ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname is invalid. Input full-width characters.")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it 'emailに@がないと登録できない' do
      @user.email = 'shaunda.johnstongmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordが5文字以下だと登録できない' do
      @user.password = '4bcde'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'passwordが129文字以上では登録できない' do
      @user.password = Faker::Internet.password(min_length: 129)
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
    end
    it 'passwordが半角数字のみの場合は登録できない' do
      @user.password = '012345'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers.")
    end
    it 'passwordが半角英字のみの場合は登録できない' do
      @user.password = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers.")
    end
    it 'passwordが全角の場合は登録できない' do
      @user.password = 'Ak０４８tb'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers.")
    end
    it 'family_nameがないと登録できない' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it 'first_nameがないと登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'family_nameが全角かなカナ漢字でないと登録できない' do
      @user.family_name = 'ﾆｾ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid. Input full-width character.")
    end
    it 'first_nameが全角かなカナ漢字でないと登録できない' do
      @user.first_name = 'ﾓﾉ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid. Input full-width character.")
    end
    it 'phonenumberがないと登録できない' do
      @user.phonenumber = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Phonenumber can't be blank")
    end
    it 'phonenumberが9桁以下の場合は登録できない' do
      @user.phonenumber = '080548504'
      @user.valid?
      expect(@user.errors.full_messages).to include("Phonenumber Input only number.")
    end
    it 'phonenumberが12桁以上の場合は登録できない' do
      @user.phonenumber = '080548504490'
      @user.valid?
      expect(@user.errors.full_messages).to include("Phonenumber Input only number.")
    end
    it 'phonenumberが半角数字以外が含まれている場合は登録できない' do
      @user.phonenumber = '080-5485-0449'
      @user.valid?
      expect(@user.errors.full_messages).to include("Phonenumber Input only number.")
    end
  end
end