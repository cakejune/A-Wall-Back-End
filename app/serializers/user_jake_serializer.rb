class UserJakeSerializer < ActiveModel::Serializer
  # include JSONAPI::Serializer
  attributes :id, :email, :username

  # has_many :alarms, serializer: AlarmSerializer
end
