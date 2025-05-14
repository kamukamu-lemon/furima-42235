class OrderAddress
  include ActiveModel::Model

  attr_accessor :item_id, :user_id, :token, :postal_code, :prefecture_id, :city, :addresses, :phone_number, :building

  with_options presence: true do
    validates :token
    validates :item_id
    validates :user_id
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :addresses
    validates :phone_number, length: { minimum: 10, maximum: 11, message: 'is too short' },
                             format: { with: /\A\d+\z/, message: 'is invalid. Input only number' }
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(order_id: order.id, phone_number: phone_number, postal_code: postal_code, prefecture_id: prefecture_id,
                   city: city, addresses: addresses, building: building)
  end
end
