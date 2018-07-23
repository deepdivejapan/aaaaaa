class AddColumnToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :event_date, :string
    add_column :events, :place, :string 
    add_column :events, :allow, :boolean , default: false
  end
end