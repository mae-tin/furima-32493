class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :delivery_fee, :prefecture, :day
  belongs_to :user
  has_one_attached :image

  validates :image, :text, :user, presence: true
  validates :name, length: { maximum: 40 }, presence: true
  validates :text, length: { maximum: 1000 }, presence: true
  validates :price, format: { with: /\A(?=.*?\d)\d+\z/i, message: 'Half-width number' },
                    numericality: { greater_than: 299, less_than: 9_999_999, message: 'Out of setting range' }, presence: true
  validates :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :days_id,
            numericality: { other_than: 1, message: 'select' }
end
