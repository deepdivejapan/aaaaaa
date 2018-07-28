class AddOptionToManagers < ActiveRecord::Migration[5.1]
  def change
    change_column :managers, :admin, :boolean, default: false, null: false
  end
end
