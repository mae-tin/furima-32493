class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :delivery_fee, :prefecture, :day
  belongs_to :user
  has_one_attached :image

  validates :name, :text, :condition_id, :derivery_fee_id,
            :prefecture_id, :days_id, :price, :user, presence: true 
  validates :category_id, numericality: { other_than: 1 }, presence: true
end
