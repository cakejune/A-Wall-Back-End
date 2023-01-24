class UserJakeSerializer < ActiveModel::Serializer
  attributes :username

  has_many :alarms, serializer: AlarmSerializer
end
