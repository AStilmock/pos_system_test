class UsersController < ApplicationController
  skip_before_action :require_login, only: [:index, :new, :create]

  def index
  end

  def new
    @user = User.new
  end

  def create
    redirect_to user_shopping_path
  end

  private 
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end