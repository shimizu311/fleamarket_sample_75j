class Item < ApplicationRecord
  has_many :images, dependent: :destroy
  belongs_to :area
  belongs_to :brand
  belongs_to :category
  belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
  belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'

  validates :name, :text, :damage, :fee, :send_date, :price, presence: true
end
