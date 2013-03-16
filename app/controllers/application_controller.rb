class ApplicationController < ActionController::Base
  protect_from_forgery

  def omniauth_failure
    redirect_to init_sign_in_users_path
    #redirect wherever you want.
  end

end
