class UserController < ApplicationController
  skip_before_action :require_login, only: [:index, :new, :create]

  def index
  end

  def new
  end

  def create
    # require 'pry'; binding.pry
    redirect_to root_path
  end

  private 
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end