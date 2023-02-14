class FriendRequestsController < ApplicationController
  def my_friend_requests
    user = User.find_by(id: params[:id])
    render json: user.received_friend_requests.where(accepted?: false)
  end

#   def update
#     #check the signed in user
#     user = User.find_by(id: params[:user_id])

#     #check the id of the person requesting friendship with the signed in user
#     friend_request =
#       user.received_friend_requests.where(requestor_id: params[:requestor_id])

#     #checkif the friend request instance with these parameters exist
#     friend_request.update!(accepted?: params[:response]) if friend_request
#   end

  def accept_friend
    #params (:user_id, :friend_id)
    request = FriendRequest.find_by(acceptor_id: params[:user_id], requestor_id: params[:friend_id])
    if request
        request.update!(accepted?: true)
        new_friendship = Friend.create!(requestor_id: params[:friend_id], acceptor_id: params[:user_id])
        render json: new_friendship
    else
        render json: {error: "no friend request between those users"}, status: :not_found
    end

  end

  def index
  friend_requests = FriendRequest.all 
  render json: friend_requests
    end
end

#parameters:
#   user_id: (logged-in user's id number)
#   requestor_id: (id of person requesting friendship of signed-in user)
#   response: (true or false)
