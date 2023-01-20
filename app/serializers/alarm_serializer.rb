

class AlarmSerializer < ActiveModel::Serializer
  attributes :id, :name, :alarm_time, :user_id, :just_time, :audio_message
  
  # has_many_attached :audio_message, serializer: AudioMessageInAlarmsSerializer

  def just_time
    #.to_time will turn this back to ruby type .time
    return self.object.alarm_time.strftime("%I:%M%p")
  end

end
