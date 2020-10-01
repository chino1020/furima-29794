require 'rails_helper'

RSpec.describe SoldOutOrder, type: :model do
  describe '購入情報の保存' do
    before do
      @sold_out_order = FactoryBot.build(:sold_out_order)
    end

    context '保存できる時' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@sold_out_order).to be_valid
      end

      it 'buildingは空でも保存できること' do
        @sold_out_order.building = nil
        expect(@sold_out_order).to be_valid
      end
    end

    context '保存できない時' do
      it 'postal_codeが空だと保存できないこと' do
        @sold_out_order.postal_code = nil
        @sold_out_order.valid?
        expect(@sold_out_order.errors.full_messages).to include('郵便番号を入力してください')
      end
      it 'prefecture_idが空だと保存できないこと' do
        @sold_out_order.prefecture_id = nil
        @sold_out_order.valid?
        expect(@sold_out_order.errors.full_messages).to include('都道府県を選択してください')
      end
      it 'cityが空だと保存できないこと' do
        @sold_out_order.city = nil
        @sold_out_order.valid?
        expect(@sold_out_order.errors.full_messages).to include('市区町村を入力してください')
      end
      it 'addressが空だと保存できないこと' do
        @sold_out_order.address = nil
        @sold_out_order.valid?
        expect(@sold_out_order.errors.full_messages).to include('番地を入力してください')
      end
      it 'phone_numberが空だと保存できないこと' do
        @sold_out_order.phone_number = nil
        @sold_out_order.valid?
        expect(@sold_out_order.errors.full_messages).to include('電話番号を入力してください')
      end
      it 'tokenが空だと保存できないこと' do
        @sold_out_order.token = nil
        @sold_out_order.valid?
        expect(@sold_out_order.errors.full_messages).to include('クレジットカード情報を入力してください')
      end
      it 'postal_codeにハイフンが含まれていないと保存できないこと' do
        @sold_out_order.postal_code = '1234567'
        @sold_out_order.valid?
        expect(@sold_out_order.errors.full_messages).to include('郵便番号はハイフンを含めた７文字で入力してください')
      end
      it 'phone_numberは11桁より多いと保存できないこと' do
        @sold_out_order.phone_number = '000000000000'
        @sold_out_order.valid?
        expect(@sold_out_order.errors.full_messages).to include('電話番号は半角数字のみで入力してください')
      end
      it 'phone_numberにハイフンが含まれていると保存できないこと' do
        @sold_out_order.phone_number = '000-0000-0000'
        @sold_out_order.valid?
        expect(@sold_out_order.errors.full_messages).to include('電話番号は半角数字のみで入力してください')
      end

      it 'prefecture_idが1だと保存できないこと' do
        @sold_out_order.prefecture_id = 1
        @sold_out_order.valid?
        expect(@sold_out_order.errors.full_messages).to include('都道府県を選択してください')
      end
    end
  end
end
