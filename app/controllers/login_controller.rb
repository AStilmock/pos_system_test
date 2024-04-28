class LoginController < ApplicationController
  def index
    
  end

  def new
    
  end

  def create
    # user = User.find_by(email: params[:email])
    # if user && user.authenticate(params[:password])
    #   set_user_session(user)
    #   redirect_to root_path, notice: "Logged in successfully"
    # else
    #   flash.now[:alert] = "Invalid email or password"
    #   render :new
    # end
    redirect_to user_shopping_index_path
  end
end