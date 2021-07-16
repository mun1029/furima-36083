require 'rails_helper'

RSpec.describe OrderSipping, type: :model do
  describe '購入情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @product = FactoryBot.create(:product)
      @order_sipping = FactoryBot.build(:order_sipping, user_id: @user.id, product_id: @product.id)
      sleep 0.1
    end

    context '購入保存ができるとき' do
      it '全ての値とtokenが正しく入力されていること' do
        expect(@order_sipping).to be_valid
      end
      it 'building_nameが空でも保存できるとき' do
        @order_sipping.building_name = ''
        expect(@order_sipping).to be_valid
      end
    end
    context '購入保存ができないとき' do
      it 'post_codeが空のとき' do
        @order_sipping.post_code = ''
        @order_sipping.valid?
        expect(@order_sipping.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeがハイフンなしで半角文字列のとき' do
        @order_sipping.post_code = '1234567'
        @order_sipping.valid?
        expect(@order_sipping.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'post_codeが3桁ハイフン4桁で半角文字列以外のとき' do
        @order_sipping.post_code = '１２３-４５６７'
        @order_sipping.valid?
        expect(@order_sipping.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'area_idが---のとき' do
        @order_sipping.area_id = 1
        @order_sipping.valid?
        expect(@order_sipping.errors.full_messages).to include("Area can't be blank")
      end
      it 'area_idが空のとき' do
        @order_sipping.area_id = ''
        @order_sipping.valid?
        expect(@order_sipping.errors.full_messages).to include("Area can't be blank")
      end
      it 'municipalityが空のとき' do
        @order_sipping.municipality = ''
        @order_sipping.valid?
        expect(@order_sipping.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空のとき' do
        @order_sipping.address = ''
        @order_sipping.valid?
        expect(@order_sipping.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空のとき' do
        @order_sipping.phone_number = ''
        @order_sipping.valid?
        expect(@order_sipping.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberは英数混合では登録できないとき' do
        @order_sipping.phone_number = 'abc12345678'
        @order_sipping.valid?
        expect(@order_sipping.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが10桁以内のとき' do
        @order_sipping.phone_number = '123456789'
        @order_sipping.valid?
        expect(@order_sipping.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが11桁以上のとき' do
        @order_sipping.phone_number = '123456789000'
        @order_sipping.valid?
        expect(@order_sipping.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが半角数値以外のとき' do
        @order_sipping.phone_number = '０９０１２３４５６７８'
        @order_sipping.valid?
        expect(@order_sipping.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'userが紐付いてないと保存できないこと' do
        @order_sipping.user_id = nil
        @order_sipping.valid?
        expect(@order_sipping.errors.full_messages).to include("User can't be blank")
      end
      it 'productが紐付いてないと保存できないこと' do
        @order_sipping.product_id = nil
        @order_sipping.valid?
        expect(@order_sipping.errors.full_messages).to include("Product can't be blank")
      end
      it 'tokenが空では登録できないこと' do
        @order_sipping.token = nil
        @order_sipping.valid?
        expect(@order_sipping.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end