require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe '商品の購入' do
    before do
      @user_order = FactoryBot.build(:user_order)
    end
    context '内容に問題がない場合' do
      it '全ての値が正しく入力されていれば購入できる' do
        expect(@user_order).to be_valid
      end
      it 'buildingが空でも購入できる' do
        @user_order.building = nil
        expect(@user_order).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空だと購入できない' do
        @user_order.token = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと購入できない' do
        @user_order.postal_code = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'prefecture_idが空だと購入できない' do
        @user_order.prefecture_id = 1
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと購入できない' do
        @user_order.city = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと購入できない' do
        @user_order.house_number = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが全角だと購入できない' do
        @user_order.phone_number = "０９０１２３４５６７"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number is invalid.")
      end
      it 'phone_numberが12桁以上だと購入できない' do
        @user_order.phone_number = "123456789012"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number is invalid.")
      end
      it 'postal_codeが半角英数字+-(ハイフン）でないと購入できない' do
        @user_order.postal_code = "1234567"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'postal_codeが全角だと購入できない' do
        @user_order.postal_code= "１２３-４５６７"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'user_idが空だと購入できない' do
        @user_order.user_id = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと購入できない' do
        @user_order.item_id = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end

# bundle exec rspec spec/models/user_order_spec.rb
