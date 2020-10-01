class SoldOutOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :token, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'はハイフンを含めた７文字で入力してください' }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は半角数字のみで入力してください' }
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 1, message: 'を選択してください' }

  def save
    sold_out = SoldOut.create(user_id: user_id, item_id: item_id)
    Order.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, sold_out_id: sold_out.id)
  end
end
