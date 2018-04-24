class UsersController < ApplicationController
    def register

    end

    def create
        @user = User.create(user_params)
        if !@user.valid?
            flash[:errors] = @user.errors.full_messages
            redirect_to '/'
        else
            session[:user_id] = @user.id
            flash[:success] = "Thanks for joining!"
            redirect_to "/users/#{session[:user_id]}/allgroups"
        end
    end

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end  


end