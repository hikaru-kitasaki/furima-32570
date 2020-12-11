class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_charges
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :days_to_ship

  with_options presence: true do
    validates :image
    validates :product_name
    validates :product_description
    validates :selling_price, format: { with: /\A[0-9]+\z/ }
  end

  validates :selling_price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true }

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :shipping_charges_id
    validates :shipping_area_id
    validates :days_to_ship_id
  end
end
