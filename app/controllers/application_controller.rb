class ApplicationController < ActionController::Base

    def current_admin
        Admin.find(session[:admin_id]) if session[:admin_id]
    end

    def current_user
        session[:current_user_id] if session[:current_user_id]
    end

    helper_method :current_admin

    helper_method :current_user

    def require_signin
        unless current_admin
          redirect_to new_session_path, alert: "Please sign in first!"
        end
    end

    def require_user_signin
        unless current_user
          redirect_to new_user_path, alert: "Please enroll first!"
        end
    end
end
