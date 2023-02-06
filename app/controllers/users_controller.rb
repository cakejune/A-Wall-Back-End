class UsersController < ApplicationController
  def create
    new_user = User.create(user_params)
    if new_user.valid?
      render json: new_user, status: :created, serializer: UserJakeSerializer
    else
      render json: {
               errors: new_user.errors.full_messages,
             },
             status: :unprocessable_entity
    end
  end

  # def show
  #   user = User.find_by(id: session[:user_id])
  #   if user
  #     render json: user, status: :created, serializer: UserJakeSerializer
  #   else
  #     render json: { error: "Unauthorized" }, status: :unauthorized
  #   end
  # end

  def jake 
    jake_user = User.find(1)
    render json: jake_user, serializer: UserJakeSerializer
  end

  private

  def authenticate_user
    unless session.include? :user_id
      return render json: { error: "Not Authorized" }, status: :unauthorized
    end
  end
  def user_params
    params.permit(:username, :password, :nickname, :password_confirmation)
  end
end
