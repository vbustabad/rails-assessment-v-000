class GithubSessionsController < ApplicationController

  def create   
    auth = request.env["omniauth.auth"]   
    @user = User.find_by_provider_and_uid(auth["provider"], auth["uid"])  

    if @user   
      session[:user_id] = @user.id     
      redirect_to user_path(@user), :notice => "Signed in."
    else
      @user = User.build_with_omniauth(auth)
      render 'users/new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, :notice => "Signed out."
  end
  
end
