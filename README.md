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
- has_many :buyers
- has_many :comments
- has_many :likes
- has_one :user_address
- has_one :credit_card


## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|card_num|integer|null: false|
|month|integer|null: false|
|year|integer|null: false|
|security_code|integer|null: false|
### Association
- belongs_to :user



## user_addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|postal_code|integer|null: false|
|area_id|references|foreign_key: true|
|city|string|null: false|
|address1|string|null: false|
|address2|string||
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


## buyersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|product_id|references|foreign_kry: true|
### Association
- belongs_to :user
- belongs_to :item


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text||
|user_id|references|foreign_key: true|
|product_id|references|foreign_kry: true|
### Association
- belongs_to :user
- belomngs_to :item


## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|product_id|references|foreign_kry: true|
### Association
- belongs_to :user
- belomngs_to :item


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|comment|text|null: false|
|category_id|references|foreign_key: true|
|brand_id|references|foreign_key: true|
|damage_id|references|foreign_key: true|
|fee_id|references|foreign_key: true|
|area_id|references|foreign_key: true|
|send_date_id|references|foreign_key: true|
|price|integer|null: false|
|buyer_id|references|foreign_key: true|
### Association
- has_many :buyers
- has_many :comments
- has_many :likes
- has_many :images
- belongs_to :area
- belongs_to :brand
- belongs_to :category
- belongs_to :damage
- belongs_to :fee
- belongs_to :send_date


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|references|foreign_key: true|
|image_url|references|foreign_key: true|
### Association
- belongs_to :item


## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :items
- has_many :categorys, through: :category_brands
- has_many :category_brands


## categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :items
- has_many :brands, through: :category_brands
- has_many :category_brands


## category_Brandsテーブル
|Column|Type|Options|
|------|----|-------|
|brand_id|references|foreign_key: true|
|category_id|references|foreign_key: true|
### Association
- belongs_to :category
- belongs_to :brand


## damagesテーブル
|Column|Type|Options|
|------|----|-------|
|damage|string|null: false|
### Association
- has_many :items


## feesテーブル
|Column|Type|Options|
|------|----|-------|
|fee|string|null: false|
### Association
- has_many :items



## send_datesテーブル
|Column|Type|Options|
|------|----|-------|
|date|string|null: false|
### Association
- has_many :items




