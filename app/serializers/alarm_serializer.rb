

class AlarmSerializer < ActiveModel::Serializer
  attributes :id, :name, :alarm_time, :user_id, :just_time, :audio_files
  
  # has_many :audio_messages
  # how do I show alarm_messages that have been attached to an alarm?
  def just_time
    #.to_time will turn this back to ruby type .time
    return self.object.alarm_time.strftime("%I:%M%p")
  end

  def audio_files
    alarms = []
      if self.object.audio_messages.attached?
        self.object.audio_messages.each do |audio|
          value = 
            {
              #make sure to add the user id who posted the message once you create friends
              id: audio.id,
              url: Rails.application.routes.url_helpers.rails_blob_url(audio, host: '4ca3-71-190-177-64.ngrok.io', only_path: false),
              name: audio.name,
              record_type: audio.record_type,
              record_id: audio.record_id,
              blob_id: audio.blob_id,
              created_at: audio.created_at,
              duration: audio.duration
            }
          
          alarms << value
        end
        # Rails.application.routes.url_helpers.url_for(audio_messages)
        return alarms
      end 
  end
   
end

