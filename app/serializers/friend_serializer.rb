class FriendSerializer < ActiveModel::Serializer
  # include JSONAPI::Serializer
  attributes :id, :requestor, :acceptor
end
