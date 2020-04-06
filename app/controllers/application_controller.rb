class ApplicationController < ActionController::Base

    #to authenticate user before restricted access
    before_action :set_current_user

    #to set current_user to prevent unauthorized access of pages
    def set_current_user
        @current_user = User.find_by(id: session[:user_id])
    end

    #to check if a user is logged in before accessing restricted pages
    def authenticate_user
        if @current_user == nil
          flash[:alert] = "You must be logged in"
          redirect_to("/login")
        end
    end
end