class Item < ApplicationRecord
  belongs_to :user

  validates :name, :text, :category_id, :condition_id, :derivery_fee_id,
            :prefecture_id, :days_id, :price, :user, presence: true 
end
