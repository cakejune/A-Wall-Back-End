

class AlarmSerializer < ActiveModel::Serializer
  attributes :id, :name, :alarm_time, :user_id, :just_time, :audio_messages
  
  has_many :audio_messages
  # how do I show alarm_messages that have been attached to an alarm?
  def just_time
    #.to_time will turn this back to ruby type .time
    return self.object.alarm_time.strftime("%I:%M%p")
  end

end
