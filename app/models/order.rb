class Order
  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id, :municipally, :address, :building_name, :phone_number, :token, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :municipally
    validates :address
    validates :phone_number, length: { maximum: 11 }, format: { with: /\A[0-9]+\z/ }
    validates :prefectures_id, numericality: { other_than: 0 }
    validates :token
  end

  validates :phone_number, numericality: { only_integer: true }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, prefectures_id: prefectures_id, municipally: municipally, address: address,
                           building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end
