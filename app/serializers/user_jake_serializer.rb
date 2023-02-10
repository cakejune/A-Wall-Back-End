class UserJakeSerializer < ActiveModel::Serializer
  include JSONAPI::Serializer
  attributes :username, :id

  has_many :alarms, serializer: AlarmSerializer
end
