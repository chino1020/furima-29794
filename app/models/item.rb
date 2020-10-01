class Item < ApplicationRecord
  has_many :comments
  belongs_to :user
  has_one :sold_out

  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :scheduled_delivery
  belongs_to_active_hash :shipping_fee

  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :category_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :sales_status_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :shipping_fee_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :scheduled_delivery_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :user
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_interger: true }
  end
end
