class Manager < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
  has_many :events  
  def self.search(search)
    if search
      Event.where(['place LIKE ?', "%#{search}%"])
    else
      Event.all
    end
  end
  
  paginates_per 5
end
