class RemoveNameFromBlogs < ActiveRecord::Migration[5.1]
  def change
    remove_column :blogs, :name, :string
  end
end
