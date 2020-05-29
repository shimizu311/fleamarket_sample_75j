class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :damage
  belongs_to_active_hash :fee
  belongs_to_active_hash :send_date
  belongs_to_active_hash :area
  belongs_to_active_hash :category
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
  # belongs_to :area
  belongs_to :brand
  accepts_nested_attributes_for :brand, allow_destroy: true
  # belongs_to :category
  belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
  # belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'
  validates_associated :images
  validates :name, :text, :category_id, :damage_id, :fee_id, :area_id, :send_date_id, :price, presence: true
  # validates :images, presence: true
end