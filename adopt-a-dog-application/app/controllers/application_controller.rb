class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def home
    @github_client_id = ENV['GH_BASIC_CLIENT_ID']
    render :home
  end

  private

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id]) if session[:user_id]
    end

    def require_admin
      redirect_to controller: 'application', action: 'home' unless current_user.admin
    end

    def require_login
      redirect_to controller: 'application', action: 'home' unless logged_in?
    end

    def require_owner
      unless current_user.owner
        flash[:alert] = "Owner registration is required. Please register as an owner in order to adopt a dog."
        redirect_to new_owner_path
      end
    end

end
