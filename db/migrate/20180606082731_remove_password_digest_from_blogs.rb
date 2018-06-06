class RemovePasswordDigestFromBlogs < ActiveRecord::Migration[5.1]
  def change
    remove_column :blogs, :password_digest, :string
  end
end
