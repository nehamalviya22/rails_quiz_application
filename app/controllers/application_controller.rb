class ApplicationController < ActionController::Base

    def current_admin
        Admin.find(session[:admin_id]) if session[:admin_id]
    end

    def current_user
        session[:current_user_id] if session[:current_user_id]
    end

    helper_method :current_admin

    helper_method :current_user
end
