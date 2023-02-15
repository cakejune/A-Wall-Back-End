class Alarm < ApplicationRecord
  belongs_to :user
  has_many_attached :audio_messages, dependent: :destroy
  validates :alarm_time, presence: true

  
end
