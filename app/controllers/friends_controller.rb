class FriendsController < ApplicationController
  def show
    friendship = Friend.find_by(id: params[:id])
    render json: friendship
  end

  def index
    friendships = Friend.all
    render json: friendships
  end

  def my_friends
    user = User.find_by(id: params[:id])
    if user
      user_friends =
        Friend.where(requestor_id: user.id).or(
          Friend.where(acceptor_id: user.id),
        )

      user_friends.each { |u| render json: u }
    end
  end
end
