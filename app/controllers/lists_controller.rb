class ListsController < ApplicationController
  def index
  end

  def new
    @list = List.new
  end

  def create 
    @list = List.new(list_params)
    @list.status = 0
    @list.user = current_user

    if @list.save
      redirect_to root_path
    else 
      render :new
    end 
  end 

  def show
    @list = List.find(params[:id])
  end

  def assign # the collector has clicked to assign this task to themselves
    list = List.find(params[:id])
    current_user.lists << list
    list.update(status: 1) # 0 - unfulfilled, 1 - doing, 2 - done
    if list.save 
      redirect_to root_path
    end
  end 

  def complete
    list = List.find(params[:id])
    list.update(status: 2) 
    if list.save 
      redirect_to root_path
    end 
  end 

  private
  
  def list_params
    # for now, the permitted format for date is yyyy-mm-dd
    params.require(:list).permit(:address, :pickUpDate, :remarks)
  end

end
