class Event < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates:title, :content, :place, :event_date, presence: true
  belongs_to :user
  belongs_to :manager, optional: true
  
  def self.search(search)
    if search
      Event.where(['place LIKE ?', "%#{search}%"])
    else
      Event.all
    end
  end
  
end
  
  
  