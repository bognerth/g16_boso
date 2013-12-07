class SessionsController < ApplicationController
  def new
  end

  def create 
    #raise User.authenticate_at_ad(params[:login],params[:password]).to_yaml
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password]) 
        session[:user_id] = @user.id
        redirect_to root_url, notice: "Logged in!"
    else
      flash.now.alert = "Authentifizierung fehlgeschlagen."
      render "new"  
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
