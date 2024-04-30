class UsersController < ApplicationController
  skip_before_action :require_login, only: [:index, :new, :create]

  

  private 
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end