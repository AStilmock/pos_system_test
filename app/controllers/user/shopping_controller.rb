class User::ShoppingController < ApplicationController
  def index
    @username = params[:username]
  end

  # def show
  # end
end