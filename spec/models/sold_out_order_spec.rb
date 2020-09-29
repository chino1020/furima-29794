require 'rails_helper'

RSpec.describe SoldOutOrder, type: :model do
  describe '購入情報の保存' do
    before do
      @sold_out_order = FactoryBot.build(:sold_out_order)
    end

    it '全ての値が正しく入力されていれば保存できること' do
      expect(@sold_out_order).to be_valid
    end
    it 'postal_codeが空だと保存できないこと' do
      @sold_out_order.postal_code = nil
      @sold_out_order.valid?
      expect(@sold_out_order.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'prefecture_idが空だと保存できないこと' do
      @sold_out_order.prefecture_id = nil
      @sold_out_order.valid?
      expect(@sold_out_order.errors.full_messages).to include("Prefecture is not a number")
    end
    it 'cityが空だと保存できないこと' do
      @sold_out_order.city = nil
      @sold_out_order.valid?
      expect(@sold_out_order.errors.full_messages).to include("City can't be blank")
    end
    it 'addressが空だと保存できないこと' do
      @sold_out_order.address = nil
      @sold_out_order.valid?
      expect(@sold_out_order.errors.full_messages).to include("Address can't be blank")
    end
    it 'phone_numberが空だと保存できないこと' do
      @sold_out_order.phone_number = nil
      @sold_out_order.valid?
      expect(@sold_out_order.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'tokenが空だと保存できないこと' do
      @sold_out_order.token = nil
      @sold_out_order.valid?
      expect(@sold_out_order.errors.full_messages).to include("Token can't be blank")
    end
    it 'postal_codeにハイフンが含まれていないと保存できないこと' do
      @sold_out_order.postal_code = "1234567"
      @sold_out_order.valid?
      expect(@sold_out_order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it 'phone_numberは11桁より多いと保存できないこと' do
      @sold_out_order.phone_number = "000000000000"
      @sold_out_order.valid?
      expect(@sold_out_order.errors.full_messages).to include("Phone number is invalid")
    end
    it 'buildingは空でも保存できること' do
      @sold_out_order.building = nil
      expect(@sold_out_order).to be_valid
    end
    it 'prefecture_idが1だと保存できないこと' do
      @sold_out_order.prefecture_id = 1
      @sold_out_order.valid?
      expect(@sold_out_order.errors.full_messages).to include("Prefecture must be other than 1")
    end
   
  end
end
