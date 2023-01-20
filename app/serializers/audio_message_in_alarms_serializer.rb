class AudioMessageInAlarmsSerializer < ActiveModel::Serializer
  attributes :audio_message_file_name, :audio_message_content_type, :audio_message_file_size, :audio_message_updated_at
end
