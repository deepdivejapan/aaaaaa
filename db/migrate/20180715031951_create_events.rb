class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.bigint "user_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "title"
      t.text "content"
      t.text "image"
      t.index ["user_id"], name: "index_events_on_user_id"

      t.timestamps
    end
  end
end
