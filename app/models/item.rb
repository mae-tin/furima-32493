class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :day

  belongs_to :user
  has_one :order

  has_one_attached :image

  with_options presence: true do
    validates :image, :text, :user
    validates :name, length: { maximum: 40 }
    validates :text, length: { maximum: 1000 }
    validates :price, format: { with: /\A(?=.*?\d)\d+\z/i, message: 'Half-width number' },
                      numericality: { greater_than: 299, less_than: 9_999_999, message: 'Out of setting range' }
    with_options numericality: { other_than: 1, message: 'select' } do
      validates :category_id
      validates :condition_id
      validates :delivery_fee_id
      validates :prefecture_id
      validates :day_id
    end
  end
end
