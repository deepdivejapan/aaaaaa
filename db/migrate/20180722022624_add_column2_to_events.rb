class AddColumn2ToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :allow, :boolean , default: false
  end
end
