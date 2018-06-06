class RemoveEmailFromBlogs < ActiveRecord::Migration[5.1]
  def change
    remove_column :blogs, :email, :text
  end
end
