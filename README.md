# fleamarket_sample DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|surname|string|null: false|
|name|string|null: false|
|j_surname|string|null: false|
|j_name|string|null: false|
|year|integer|null: false|
|month|integer|null: false|
|day|integer|null: false|
### Association
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :sell_items, class_name: 'Item', foreign_key: 'seller_id'
- has_many :buy_items, class_name: 'Item', foreign_key: 'buyer_id'
- has_one :user_address, dependent: :destroy
- has_one :credit_card, dependent: :destroy


## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|card_id|string|null: false|
|customer_id|string|null: false|
### Association
- belongs_to :user


## user_addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|postal_code|integer|null: false|
|area_id|references|foreign_key: true|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string||
|tel|integer||
### Association
- belongs_to :user
- belongs_to :area


## areasテーブル
|Column|Type|Options|
|------|----|-------|
|area_name|string|null: false|
### Association
- has_many :user_addresses
- has_many :items


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text||
|user_id|references|foreign_key: true|
|product_id|references|foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item


## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|product_id|references|foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|text|text|null: false|
|category_id|references|foreign_key: true|
|brand_id|references|foreign_key: true|
|damage|integer|null:false|
|fee|integer|null:false|
|area_id|references|foreign_key: true|
|send_date|integer|null:false|
|price|integer|null: false|
|buyer_id|references|foreign_key: true|
|seller_id|references|foreign_key: true|
### Association
- has_many :users, though: [:comments, :likes]
- has_many :comments, dependent: :destroy
- has_many :likes
- has_many :images, dependent: :destroy
- belongs_to :area
- belongs_to :brand
- belongs_to :category
- belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
- belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id'


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|foreign_key: true, null :false|
|image_url|string|null :false|
### Association
- belongs_to :item


## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :items
- has_many :categories


## categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null :false|
### Association
- has_many :items
- has_many :brands