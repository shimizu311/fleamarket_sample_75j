class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :damage
  belongs_to_active_hash :fee
  belongs_to_active_hash :send_date
  belongs_to_active_hash :area
  belongs_to_active_hash :category

  # has_many :images, dependent: :destroy 
  # belongs_to :area
  # belongs_to :brand
  # belongs_to :category
  # belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
  # belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'

  validates :name, :text, :category_id, :damage_id, :fee_id, :area_id, :send_date, :price, presence: true
end
