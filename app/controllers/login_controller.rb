class LoginController < ApplicationController
  def index
    
  end

  def new
    
  end

  def create
    redirect_to user_shopping_index_path
  end
end