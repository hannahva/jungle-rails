class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    if @user = User.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = @user.id
      redirect_to :products, notice: "Signed in!"
    else
      redirect_to "/login", notice: "There was a problem logging in"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :products, notice: "logged out"
  end
end
