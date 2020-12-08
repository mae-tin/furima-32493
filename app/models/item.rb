class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :delivery_fee, :prefecture, :day
  belongs_to :user
  has_one_attached :image

  validates :image, :name, :text, :user, presence: true
  validates :price, format: { with: /\A[0-9]+\z/, message: 'Half-width number' },
            numericality:{ greater_than: 300, less_than: 9999999, message: "Out of setting range" }, presence: true
  validates :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :days_id,
            numericality: { other_than: 1,message: "select" }
end
