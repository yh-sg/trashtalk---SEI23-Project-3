class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:index]

  def index # landing page when users login, => shows all the lists
    if (current_user.role === 0) # regular user
      @lists = List.where(status: 0)
    else 
      # if the user is an admin/ regular user, just show all lists
      @lists = List.all
    end
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
