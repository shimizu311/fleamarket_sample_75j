class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :sell_items, class_name: 'Item', foreign_key: 'seller_id'
  has_many :buy_items, class_name: 'Item', foreign_key: 'buyer_id'
  has_one :user_address, dependent: :destroy
  has_one :credit_card, dependent: :destroy

  validates :nickname, :year, :month, :day, presence: true
  validates :surname, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :j_surname, presence: true, format: { with: /\A[ぁ-んー－]+\z/ }
  validates :j_name, presence: true, format: { with: /\A[ぁ-んー－]+\z/ }
end
