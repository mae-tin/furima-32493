class OrderAddress
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :building, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :token
    validates :postcode, format: {with: /\A\d{3}[-]\d{4}\z/, message: "Input correctly"}
    validates :prefecture_id, numericality: { other_than: 1, message: 'select' }
    validates :city
    validates :block
    validates :phone_number , format: {with: /\A\d{11}\z/, message: "Input correctly"}
    validates :user_id
    validates :item_id
  end
  
  def save
    order = Order.create(user_id: user_id,item_id: item_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, order_id: order.id)
  end
end
