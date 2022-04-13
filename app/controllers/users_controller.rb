class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        @user_exist=User.find_by(email:@user.email)
        if  @user_exist
            session[:current_user_id] = @user_exist.id
            redirect_to quiz_question_path
        else
            if @user.save
                session[:current_user_id] = @user.id
                Score.create(user: @user)
                redirect_to quiz_information_path

            else
                render :new
            end
        end
    end

    def destroy
        session[:current_user_id] = nil
        redirect_to root_path, notice: "You are now signed out!"
    end

private
  def user_params
    params.require(:user).permit(:name, :email, :contact_number)
  end
end
