class AddAdminToManagers < ActiveRecord::Migration[5.1]
  def change
    add_column :managers, :admin, :boolean , default: false, null: false
  end
end
