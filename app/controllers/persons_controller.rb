class PersonsController < ApplicationController
#before_action :authenticate_user!
#after_action :verify_authorized

#def profile
#@user = User.create(params.require(:user).permit(:email,
#  :password))
#session[:user_id] = @user.id
# redirect_to '/index'
#end
end

# def index
# if params[:filter] == 'Users'
# @users = User.where("role = 0")
#  @filter = 'Users'
#elsif params[:filter] == 'Managers'
#   @users = User.where("role > 0")
#  @filter = 'Managers'
#else
#   @users = User.all
#   @filter = 'All'
#  end
#  authorize User
#  end


