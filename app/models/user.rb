class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :birthday, presence: true
  validates :password,
            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'Include both letters and numbers' }
  validates :last_name, :first_name, presence: true,
                                     format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters' }
  validates :last_name_kana, :first_name_kana, presence: true,
                                               format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters' }
end
