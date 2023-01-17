class AlarmJustTimeSerializer < ActiveModel::Serializer
  attributes :id, :name, :just_time, :user_id

  def just_time
    return self.object.alarm_time.strftime("%I:%M%p")
  end
end
