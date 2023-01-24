class AlarmsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_data
  # rescue_from Aws::S3::Errors::AccessDenied, with: :access_denied
  require "aws-sdk-s3"

  def show
    alarm = Alarm.find_by(id: params[:id])

    render json: alarm
  end

  def show_audio
    audio =
      Alarm
        .find_by(id: params[:id])
        .audio_messages
        .find_by(id: params[:audio_id])
    if audio
      render json: {
               id: audio.id,
               url:
                 Rails.application.routes.url_helpers.rails_blob_url(
                   audio,
                   only_path: true,
                 ),
               name: audio.name,
               record_type: audio.record_type,
               record_id: audio.record_id,
               blob_id: audio.blob_id,
               created_at: audio.created_at,
             }
    else
      render json: { error: "Audio message not found" }, status: :not_found
    end
  end

  def purge_audio
    audio =
      Alarm.find_by(id: params[:id]).audio_messages.find_by(id: params[:audio_id])
    if audio
      audio.purge
    else
      render json: { error: "Audio messsage not found" }, status: :not_found
    end
  end

  def index
    alarms = Alarm.all
    render json: alarms
  end

  def create
    new_alarm = Alarm.create!(params[:alarm_params])
    render json: new_alarm, status: :accepted
  end

  def update
    alarm = Alarm.find_by(id: params[:id])
    if alarm
      alarm.update!(alarm_time: params[:alarm_time])
      render json: alarm
    end
  end

  def add_audio_message
    alarm = Alarm.find_by(id: params[:id])
    if alarm
      if params[:audio_messages]
        alarm.audio_messages.attach(params[:audio_messages])
      end
      render json: alarm, status: :ok
    else
      render json: { error: "Alarm Not Found" }, status: :not_found
    end
  end

  private

  def alarm_params
    params.permit(:name, :alarm_time, :user_id, :audio_messages)
  end

  def invalid_data(invalid)
    render json: {
             errors: invalid.record.errors.full_messages,
           },
           status: :unprocessable_entity
  end
  # def access_denied
  # render json: {error: "We've hit a access point"}
  # end
end

#moved this action to the alarms_in_user_serializer
# def specific_audio(alarm)
#   alarms = []
#     if alarm.audio_messages.attached?
#       alarm.audio_messages.each do |audio|
#         value = {
#           id: audio.id,
#           url: rails_blob_url(audio)
#         }
#         alarms << value
#       end
#       # Rails.application.routes.url_helpers.url_for(audio_messages)
#       return alarms
#     end
# end

# def purge
# alarm = Alarm.find_by(id: params[:id])

# end
