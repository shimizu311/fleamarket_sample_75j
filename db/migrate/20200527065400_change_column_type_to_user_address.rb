class ChangeColumnTypeToUserAddress < ActiveRecord::Migration[5.2]
  def change
    remove_reference :user_addresses, :area
    add_column :user_addresses, :area_id, :integer
  end
end
