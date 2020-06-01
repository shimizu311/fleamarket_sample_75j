class ChangeColumnsTypeUserAddress < ActiveRecord::Migration[5.2]
  def change
    change_column :user_addresses, :postal_code, :string
    change_column :user_addresses, :tel, :string
  end
end
