class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    before_action :set_cors_headers

    include ActionController::Cookies

    def set_cors_headers
      headers['Access-Control-Allow-Origin'] = 'http://localhost:19006'
      headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
      headers['Access-Control-Request-Method'] = '*'
      headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    end

    def hello_world
      session[:count] = (session[:count] || 0) + 1
      render json: { count: session[:count] }
    end

end
