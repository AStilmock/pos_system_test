class LoginController < ApplicationController
  def index
    # require 'pry'; binding.pry
    # Login index page is the landing page for the login form
    # Login index page routes through login method
    # Login form directs to user/shopping index page if successful
  end

  def new
    @user = User.new
  end

  def create
    # user = user_params
    # user[:username] = user[:username].downcase
    # new_user = User.create(user_params)
    # session[:user_id] = new_user.id
    # flash[:success] = "Welcome, #{new_user.username}!"
    redirect_to user_shopping_path
  end

  def login
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.username}!"
      redirect_to user_shopping_path
    else
      flash[:error] = "Sorry, your credentials did no match, please try again."
      render :login
    end
  end

  # private 
  # def user_params
  #   params.require(:user).permit(:username, :email, :password)
  # end
end