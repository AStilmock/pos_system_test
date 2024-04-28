class User::ShoppingController < ApplicationController
  def index
    @user = User.find_by_username(params[:username])
    @username = @user.username
    # require 'pry'; binding.pry
  end
end