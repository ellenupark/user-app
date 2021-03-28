class ApplicationController < ActionController::Base
    helper_method :logged_in?
    helper_method :current_user

    def current_user
        User.find_by(id: session[:user_id])  
    end

    def logged_in?
        !current_user.nil?
    end
end
