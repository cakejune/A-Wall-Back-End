class UserJakeSerializer < ActiveModel::Serializer
  attributes :username, :id

  has_many :alarms, serializer: AlarmSerializer
end
