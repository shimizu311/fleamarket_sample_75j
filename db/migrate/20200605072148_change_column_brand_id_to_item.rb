class ChangeColumnBrandIdToItem < ActiveRecord::Migration[5.2]
  def change
    remove_reference :items, :brand
    add_column :items, :brand, :string
  end
end
