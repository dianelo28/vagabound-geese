class SessionsController < ApplicationController

	def new
	end

	def create
        @user = User.find_by(email:params[:sessions][:email]).try(:authenticate, params[:sessions][:password])
        
        if @user
            session[:user_id] = @user.id
            redirect_to profile_path
        else
            flash[:error] = "Sorry, wrong email or password"
            redirect_to login_path
        end
    end

	def destroy
		reset_session
		redirect_to login_path notice: 'logout'
	end
end
