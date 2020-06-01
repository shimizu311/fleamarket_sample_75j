class RenameSendDateColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :send_date, :send_date_id
  end
end
