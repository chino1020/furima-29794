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
      expect(@item.errors.full_messages).to include('出品画像を入力してください')
    end
    it 'nameが空だと保存できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('商品名を入力してください')
    end
    it 'infoが空だと保存できないこと' do
      @item.info = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('商品の説明を入力してください')
    end
    it 'priceが空だと保存できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('価格を入力してください')
    end
    it 'category_idが空だと保存できないこと' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('カテゴリーを入力してください')
    end
    it 'sales_status_idが空だと保存できないこと' do
      @item.sales_status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('商品の状態を入力してください')
    end
    it 'shipping_fee_idが空だと保存できないこと' do
      @item.shipping_fee_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('配送料の負担を入力してください')
    end
    it 'prefecture_idが空だと保存できないこと' do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('発送元の地域を入力してください')
    end
    it 'scheduled_delivery_idが空だと保存できないこと' do
      @item.scheduled_delivery_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('発送までの日数を入力してください')
    end
    it '紐づくuserがいないと保存できないこと' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Userを入力してください')
    end
    it 'priceが300より小さいと保存できないこと' do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include('価格は300以上の値にしてください')
    end
    it 'priceが9999999より大きいと保存できないこと' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('価格は9999999以下の値にしてください')
    end
    it 'priceが半角数字のみでないと保存できないこと' do
      @item.price = 'test111'
      @item.valid?
      expect(@item.errors.full_messages).to include('価格は数値で入力してください')
    end
  end
end
