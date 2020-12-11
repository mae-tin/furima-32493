class Address < ApplicationRecord
  belongs_to :order

  with_options presence: true do
    validates :postcode, format: { with: /\A\d{3}-\d{4}\z/, message: 'Half-width number' }
    validates :prefecture_id
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A\d{11}\z/, message: 'Half-width number' }
  end
end
