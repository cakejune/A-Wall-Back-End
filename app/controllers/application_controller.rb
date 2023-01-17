class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token

    include ActionController::Cookies

    def hello_world
      session[:count] = (session[:count] || 0) + 1
      render json: { count: session[:count] }
    end

end
