class Item < ApplicationRecord
  has_many :comments
  belongs_to :user
  has_one :sold_out
  has_one_attached :image

  validates :image, :name, :info, :category_id, :sales_status_id, :shipping_fee_id, :prefecture_id, :scheduled_delivery_id, :price, :user, presence: true
  validates :category_id, :sales_status_id, :shipping_fee_id, :prefecture_id, :scheduled_delivery_id, numericality: { other_than: 1 }
  validates :price, :numericality => { :greater_than_or_equal_to => 300, :less_than_or_equal_to => 9999999, :only_interger => true }
  
end
