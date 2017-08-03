class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.new.find_by_email(params[:email])

    if @user && @user.authenticate(params[:password])
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
