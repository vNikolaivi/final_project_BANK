class ApplicationController < ActionController::Base
  #before_action :authorized
  helper_method :current_user
  helper_method :logged_in?

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def authorized
    redirect_to '/index' unless logged_in?
  end

  def after_sign_in_path_for(resource)
     current_user_path
   end
  def after_sign_out_path_for(resource_or_scope)
    request.referrer
  end
end
