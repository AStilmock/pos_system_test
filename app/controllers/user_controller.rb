class UserController < ApplicationController
  skip_before_action :require_login, only: [:index, :new, :create]

  def index
  end

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session.new[:user_id] = @user.id
      redirect_back_or_to root_path, notice: "Welcome, your account has been created successfully!"
    else
      flash.now[:alert] = 'Profile not created. Please try again.'
      render action: 'new'
    end
  end

  private 
  def user_params
    params.require(:user).permit(:username, :email, :password, :crypted_password)
  end
end