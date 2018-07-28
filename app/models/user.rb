class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  def add_error_user
    if name.blank?
      errors[:base] << "名前を入力して下さい"
    end
    if email.blank?
      errors[:base] << "Emailを入力して下さい"
    end
    if capacity.blank?
      errors[:base] << "資格を入力して下さい"
    end
  end
  
    validates :name,  length: { maximum: 30 }
    validates :email, length: { maximum: 255 },
                      format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
                      before_save { email.downcase! }
                      has_secure_password
    validates :capacity, length: { maximum: 255 }                  
    validates :password, length: { minimum: 6 }
    has_many :events
    
    validate :add_error_user
 
  
end
