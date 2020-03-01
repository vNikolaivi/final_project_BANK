class PersonsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :authenticate_user!
  #validates :email, :first_name, :last_name, :birthday, :geneder, :phone, presence: true

  #validates :email, format: { with: /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/, without: /test.com$/, message: 'Only emails allowed' }
  #validates :email, format: { without: /test.com$/, message: 'Test emails are not allowed' }

  #validates :phone, numericality: {only_integer: true, greater_than: 12}
  # validates :first_name, uniqueness: {scope: :email, message: 'should only one user with name and email'}

  #before_action :authenticate_user!
  #after_action :verify_authorized

  #def profile
  #@user = User.create(params.require(:user).permit(:email,
  #  :password))
  #session[:user_id] = @user.id
  # redirect_to '/index'
  #end
end