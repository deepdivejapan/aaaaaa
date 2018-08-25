class Contact < ApplicationRecord
    validates:name, :email, :content, presence: true
    default_scope -> { order(created_at: :desc) }
end
