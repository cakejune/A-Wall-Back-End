class AlarmsInUserSerializer < ActiveModel::Serializer
  include JSONAPI::Serializer
  attributes :id, :name, :alarm_time, :user_id, :audio_files

  def audio_files
    alarms = []
      if self.object.audio_messages.attached?
        self.object.audio_messages.each do |audio|
          value = {
            id: audio.id,
            url: Rails.application.routes.url_helpers.rails_blob_url(audio, only_path: true)
          }
          alarms << value
        end
        # Rails.application.routes.url_helpers.url_for(audio_messages)
        return alarms
      end 
  end

  
end
