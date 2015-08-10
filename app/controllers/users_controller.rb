class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to signup_path
    end

  end

  def show
    @user = User.find(session[:user_id])
    render :show
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :current_city, :password)
    end

end
