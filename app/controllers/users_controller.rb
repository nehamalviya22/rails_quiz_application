class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:current_user_id] = @user.id
            Score.create(user: @user)
            redirect_to quiz_information_path

        else
            render :new
        end
    end

private
  def user_params
    params.require(:user).permit(:name, :email, :contact_number)
  end
end
