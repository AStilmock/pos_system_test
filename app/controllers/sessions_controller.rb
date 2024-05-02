# require './sorcery/controller.rb'
# require './sorcery/model.rb'
class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  
  def new
  end

  def create
    @user = login(params[:email], params[:password])
    require 'pry'; binding.pry
    if @user
      redirect_to root_path, notice: 'Login Successful'
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to(:users, notice: 'Logged out!')
  end
end
