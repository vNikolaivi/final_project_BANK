class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
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
        format.html { redirect_to action: "index", notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end



  def update
    respond_to do |format|
      @user = User.find(params[:id])
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
    user = User.find(params[:id])
    user.destroy
    #authorize user
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :encrypted_password, :birthday, :geneder, :phone)
  end
end