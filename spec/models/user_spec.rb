require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nickname,email,password,password_confirmation,first_name,last_name,first_name_kana,last_name_kana,birth_dateが存在すれば登録できること' do
      expect(@user).to be_valid
    end
    it 'nicknameが空では登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('ニックネームを入力してください')
    end
    it 'emailが空では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールを入力してください')
    end
    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードを入力してください')
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
    end
    it 'first_nameが空では登録できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('名前を入力してください')
    end
    it 'last_nameが空では登録できないこと' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('苗字を入力してください')
    end
    it 'first_name_kanaが空では登録できないこと' do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('名前(カナ)を入力してください')
    end
    it 'last_name_kanaが空では登録できないこと' do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('苗字(カナ)を入力してください')
    end
    it 'birth_dateが空では登録できないこと' do
      @user.birth_date = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('生年月日を入力してください')
    end
    it 'emailが重複していると登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
    end
    it 'emailに@が含まれていないと登録できないこと' do
      @user.email = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールは不正な値です')
    end
    it 'passwordが５文字以下だと登録できないこと' do
      @user.password = '0Aagi'
      @user.password_confirmation = '0Aagi'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
    end
    it 'passwordは半角英数字混合でないと登録できないこと' do
      @user.password = '000000'
      @user.password_confirmation = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは不正な値です')
    end
    it 'first_nameが全角（漢字、ひらがな、カタカナ）でないと登録できないこと' do
      @user.first_name = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include('名前は不正な値です')
    end
    it 'last_nameが全角（漢字、ひらがな、カタカナ）でないと登録できないこと' do
      @user.last_name = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include('苗字は不正な値です')
    end
    it 'first_name_kanaが全角（カタカナ）でないと登録できないこと' do
      @user.first_name_kana = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include('名前(カナ)は不正な値です')
    end
    it 'last_name_kanaが全角（カタカナ）でないと登録できないこと' do
      @user.last_name_kana = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include('苗字(カナ)は不正な値です')
    end
  end
end
