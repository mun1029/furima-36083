class OrderSipping
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :post_code, :area_id,
  :municipality, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :product_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :municipality
    validates :address
    validates :phone_number, format: {with: /\A[0-9]{10,11}\z/, message: "can't be blank"}
  end

  def save
    order = Order.create(user_id: user_id, product_id: product_id)
    Sipping.create(order: order, post_code: post_code, area_id: area_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number)
  end

end