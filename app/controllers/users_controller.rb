class UsersController < ApplicationController
    
    
    def get_user_alarms
        user = User.find_by(id: params[:id])
        alarms = []
        user.alarms.each do |alarm|
        alarms << alarm
       end
       # render json: params[:id]
       render json: alarms
        end

        # def my_friend_requests
        #     user = User.find_by(id: params[:id])
        #     render json: user.received_friend_requests
        # end

        # def my_friend_requests
        #     user = User.find_by(id: params[:id])
        #     friend_requestees = []
        #     if user
            
        #         user.received_friend_requests.each do |friend_request|
        #         requestor = User.find_by(id: friend_request.requestor_id)
        #         friend_requestees << requestor
        #     end
        #     render json: friend_requestees, serializer: UserJakeSerializer

        #     end
        # end


end
