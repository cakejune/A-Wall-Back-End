# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  respond_to :json

  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create

  #   user = User.find_by(email: params[:email])
  #   if user && user.valid_password?(params[:password])
  #     respond_with user, status: :created
  #   else
  #     render json: {
  #              error: "Incorrect email or password",
  #            },
  #            status: :unprocessable_entity
  #   end
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  private

  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: {
               status: {
                 code: 200,
                 message: "Logged in successfully.",
               },
               data:
                 UserSerializer.new(resource).serializable_hash[:data][
                   :attributes
                 ],
             },
             status: :ok
    else
      render json: {
               errors: "Incorrect email or password."
             },
             status: :unprocessable_entity
    end
  end

  def respond_to_on_destroy
    if current_user
      render json: {
               status: 200,
               message: "logged out successfully",
             },
             status: ok
    else
      render json: {
               status: 401,
               message: "Could not find an active session.",
             },
             status: :unauthorized
    end
  end
end
