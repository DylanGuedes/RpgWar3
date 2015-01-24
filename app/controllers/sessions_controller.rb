class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])

    else
      flash.now[:error] = "Wrong Login/password combination"
      render 'new'
    end
  end

  def destroy
  end
end
