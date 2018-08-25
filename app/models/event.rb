class Event < ApplicationRecord
  mount_uploader :image, ImageUploader
  
  def add_error_event
    if title.blank?
      errors[:base] << "タイトルを入力して下さい"
    end
    if event_date.blank?
      errors[:base] << "開催日を入力して下さい"
    end
    if place.blank?
      errors[:base] << "開催場所を入力して下さい"
    end
    if content.blank?
      errors[:base] << "内容を入力して下さい"
    end
  end
  
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
  
  paginates_per 5
  
  validate :add_error_event
  
  default_scope -> { order(created_at: :desc) }
  
end
  
  
  