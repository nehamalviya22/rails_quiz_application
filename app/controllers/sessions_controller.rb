class SessionsController < ApplicationController
    def new
    end

    def create
        admin = Admin.find_by(email: params[:email])
        if admin && admin.authenticate(params[:password])
            session[:admin_id] = admin.id
            redirect_to admin_questions_path
        else
            flash.now[:alert] = "Invalid email/password combination!"
            render :new
        end
    end

    def destroy
        session[:admin_id] = nil
        redirect_to root_path, notice: "You are now signed out!"
    end
end
