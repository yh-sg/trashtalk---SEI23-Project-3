class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:index]

  def index
  end

  def new
  end

  def create
  end

  def destroy
  end

  private
  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:fname, :lname, :desc, :username, :password,:email, :phone, :address, :city, :country)
  end

end
