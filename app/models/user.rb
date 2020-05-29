class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :sell_items, class_name: 'Item', foreign_key: 'seller_id'
  has_many :buy_items, class_name: 'Item', foreign_key: 'buyer_id'
  has_one :user_address, dependent: :destroy
  has_one :credit_card, dependent: :destroy

  validates :nickname, :surname, :name, :j_surname, :j_name, :year, :month, :day, presence: true
end
