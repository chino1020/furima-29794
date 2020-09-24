require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品した商品の保存' do
    it 'image, name,info,price,category_id,sales_status_id,shipping_fee_id,prefecture_id,scheduled_delivery_idが存在すれば保存できること' do
      expect(@item).to be_valid
    end
    it 'imageが空だと保存できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'nameが空だと保存できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it 'infoが空だと保存できないこと' do
      @item.info = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Info can't be blank")
    end
    it 'priceが空だと保存できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'category_idが空だと保存できないこと' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'sales_status_idが空だと保存できないこと' do
      @item.sales_status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Sales status can't be blank")
    end
    it 'shipping_fee_idが空だと保存できないこと' do
      @item.shipping_fee_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
    end
    it 'prefecture_idが空だと保存できないこと' do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'scheduled_delivery_idが空だと保存できないこと' do
      @item.scheduled_delivery_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
    end
    it '紐づくuserがいないと保存できないこと' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
  end
end
