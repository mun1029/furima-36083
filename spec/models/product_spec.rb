require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '出品機能' do
    context '出品できるとき' do
      it '必須項目が全て記述されているとき' do
        expect(@product).to be_valid
      end
      it 'priceが半角数値で300以上のとき' do
        @product.price = 300
        expect(@product).to be_valid
      end
      it 'priceが半角数値で9999999以下のとき' do
        @product.price = 9999999
        expect(@product).to be_valid
      end
    end
    context '出品できないとき' do
      it 'imageが空のとき' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空のとき' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空のとき' do
        @product.description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが---のとき'do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
      it 'delivery_idが---のとき' do
        @product.delivery_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery can't be blank")
      end
      it 'area_idが---のとき' do
        @product.area_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Area can't be blank")
      end
      it  'delivery_day_idが---のとき' do
        @product.delivery_day_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery day can't be blank")
      end
      it 'status_idが---のとき' do
        @product.status_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Status can't be blank")
      end
      it 'priceが300以下のとき' do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceが9999999以上のとき' do
        @product.price = 10000000
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end
