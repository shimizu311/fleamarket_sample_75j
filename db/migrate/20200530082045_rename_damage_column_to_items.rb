class RenameDamageColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :damage, :damage_id
  end
end