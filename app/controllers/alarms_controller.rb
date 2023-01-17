class AlarmsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_data
  def show
    alarm = Alarm.find_by(id: params[:id])
    render json: alarm
  end

  def index
    alarms = Alarm.all
    render json: alarms
  end

  #put a note here as to what to put in for the time
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

  private

  def alarm_params
    params.permit(:name, :alarm_time, :user_id)
  end

  def invalid_data(invalid)
    render json: {
             errors: invalid.record.errors.full_messages,
           },
           status: :unprocessable_entity
  end
end
