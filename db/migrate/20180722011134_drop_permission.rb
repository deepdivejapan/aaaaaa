class DropPermission < ActiveRecord::Migration[5.1]
  def change
    drop_table :permissions
  end
end
