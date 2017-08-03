class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.new.find_by_email(params[:email])

    if @user && @user.authenticate(params[:password])
  end

  def destroy
  end
end
