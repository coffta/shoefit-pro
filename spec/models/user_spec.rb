require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '内容に問題ない場合' do
      it '全て正常' do
        user = User.new(
          nickname: "test",
          email: "test@test.com",
          password: "password123",
          password_confirmation: "password123",
          password_confirmation: "password123",
          name: "John Doe",
          address: "123 Main St",
          phone_number: "12345678909"
          )
        expect(user).to be_valid
        end
    end

    context '内容に問題がある場合' do
      it 'nickname:必須' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'password:必須' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'password:6文字以上' do
        @user.password = 'aA1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'password:半角英数混合(半角英語のみ)' do
        @user.password = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
      it 'password:半角英数混合(数字のみ)' do
        @user.password = '1111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
      it 'password:半角英数混合(全角英数混合)' do
        @user.password = 'ＡＡＡＡＡ１１'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
      end
      it 'password:確認用と一致' do
        @user.password_confirmation = @user.password + 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'email:必須' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'email:@を含む形式' do
        @user.email = 'test.co.jp'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it '電話番号が空だと保存できないこと' do
        @user.phone_number = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンがあると保存できないこと' do
        @user.phone_number = '123-1234-1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('Phone number is invalid. ')
      end
      it '電話番号が12桁以上あると保存できないこと' do
        @user.phone_number = '12345678910123111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Phone number is invalid. ')
      end
      it '電話番号が9桁以下であると保存できないこと' do
        @user.phone_number = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Phone number is invalid. ')
      end
      it '住所が空だと保存できないこと' do
        @user.address = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Address can't be blank")
      end
      it 'name:必須' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
    end
  end
end
