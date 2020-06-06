class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :damage
  belongs_to_active_hash :fee
  belongs_to_active_hash :send_date
  belongs_to_active_hash :area

  belongs_to :category
  belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
  # belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  validates_associated :images
  validates :images, presence: true

  validates :name, presence: true, length: { maximum: 40 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :text, :category_id, :damage_id, :fee_id, :area_id, :send_date_id, presence: true

  def self.search(search)Item.all
    if search
      Item.where('name LIKE? OR text LIKE?', "%#{search}%", "%#{search}%").order(created_at: :desc)
    else
      Item.all.order(created_at: :desc)
    end
  end
end