class UsersController < ApplicationController
  #load_and_authorize_resource
  #before_action :authenticate_user!
  include Devise::Controllers::Helpers
  before_action :authenticate_user!
   before_action :set_user, only: [:show, :edit, :update, :destroy] #authenticate_user!
  #set_user, only: [:show, :edit, :update, :destroy]
  # after_action :verify_authorized

  def index
    if params[:filter] == 'Users'
      @users = User.where('role = 0')
      @filter = 'Users'
    elsif params[:filter] == 'Managers'
      @users = User.where('role = 1')
      @filter = 'Managers'
    elsif params[:filter] == 'Admins'
      @users = User.where('role = 2')
      @filter = 'Admins'
    else
      @users = User.all
      @filter = 'All'
    end
      #authorize User
  end

  def show
    set_user
      #authorize @user
  end

  def new
    @user = User.new
      #authorize User
  end

  def edit

  end


  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to action: 'index', notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
      #authorize current_user
  end


  def update
    respond_to do |format|
      #authorize @user
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    # authorize user
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
  def authenticate_user!(opts={})
    opts[:scope] = :user
    warden.authenticate!(opts) if !devise_controller? || opts.delete(:force)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:city_id, :id, :role, :first_name, :last_name, :nickname, :password, :email, :encrypted_password, :password_confirmation, :password_reset_token, :current_password, :birthday, :geneder, :phone)
  end
end