class SessionsController < ApplicationController
  skip_before_action :authorized, only: %i[new create index]
  before_action :authenticate_user!

  def new
    #login Page - new.html.erb
  end

  def login
  end

  def create
    @user = User.find_by(resource_name: params[:resource_name])
    @password = params[:resource_name][:password]
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/index', notice: 'Logged in successfully'
    else
      redirect_to '/login', alert: 'Invalid username/password combination'
    end
  end

  def destroy
    reset_session
    redirect_to login_path, notice: 'You have been logged out'
  end

  def page_requires_login
  end

end
