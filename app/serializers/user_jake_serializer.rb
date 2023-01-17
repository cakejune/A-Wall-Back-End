class UserJakeSerializer < ActiveModel::Serializer
  attributes :username

  has_many :alarms
end
