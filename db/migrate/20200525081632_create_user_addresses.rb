class CreateUserAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :user_addresses do |t|
      t.references :user,         foreign_key: true
      t.integer    :postal_code,  null: false
      t.references :area,         foreign_key: true
      t.string     :city,         null: false
      t.string     :house_number, null: false
      t.string     :building_name
      t.integer    :tel
      t.timestamps
    end
  end
end