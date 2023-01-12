class Alarm < ApplicationRecord
  belongs_to :user

  validates :alarm_time, presence: true
end
