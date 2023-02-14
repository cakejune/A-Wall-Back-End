class FriendRequestSerializer < ActiveModel::Serializer
  attributes :id, :accepted?, :requestor, :acceptor


end
