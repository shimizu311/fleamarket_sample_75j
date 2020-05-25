class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string  :name,         null: false
      t.text    :text,         null: false
      t.bigint  :category_id,  foreign_key: true
      t.bigint  :brand_id,     foreign_key: true
      t.integer :damage,       null: false
      t.integer :fee,          null: false
      t.bigint  :area_id,      foreign_key: true
      t.integer :send_date,    null: false
      t.integer :price,        null: false
      t.bigint  :buyer_id,     foreign_key: true
      t.bigint  :seller_id,    foreign_key: true
      t.timestamps
    end
  end
end
