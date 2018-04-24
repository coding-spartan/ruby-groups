class SessionsController < ApplicationController

    def index
    
    end
    
    def login
        if User.find_by(email: params[:email]).try(:authenticate, params[:password])
            @user = User.find_by(email: params[:email])
            session[:user_id] = @user.id

            redirect_to "/users/#{current_user.id}/allgroups"
        else
            flash[:errors] = "Invalid User Name or Password"
            redirect_to '/'
        end
    end
    
    def destroy
        session[:user_id] = nil
        redirect_to "/"
    end
    
    end