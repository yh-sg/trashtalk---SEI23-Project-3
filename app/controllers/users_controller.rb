class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:index]

  def index # landing page when users login, => shows all the lists
    puts "meow"
    puts ENV["GOOGLE_API_KEY"]

    if (current_user.role === 0) # user is a collector
      @lists = List.where(status: 0)
    else 
      # if the user is an admin/ regular user, just show all lists
      @lists = List.all
    end
  end

  def show # show user's dashboards
    @user = User.find(params[:id])

    # initialise
    lists = Array.new
    @in_progress = Array.new
    @completed = Array.new

    # if the user is a collector
    if @user.role === "user"
      # find all the Lists where the user is a collector
      lists = List.where(collector: @user.id)
    elsif @user.role === "recycler"
      lists = User.find(@user.id).lists
    else # this person is an admin, just display everything
      lists = List.all
    end 

    # we filter the lists to completed and in_progress
    lists.each do |list|
      if list.status === 1 || list.status === 0 then @in_progress << list
      else @completed << list
      end 
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
