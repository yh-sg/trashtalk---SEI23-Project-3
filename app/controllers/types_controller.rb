class TypesController < ApplicationController
  before_action :set_type, only: [:show, :edit, :destroy, :update]

  def index
    @types = Type.all
  end

  def create
  end

  def new
    @type = Type.new
  end

  def show
  end

  def destroy
    #@type = Type.find(params[:id]).destroy
    #redirect_to path
  end

  def update
    #list = List.find(params[:list_id])
    if @type.update(type_params)
    #redirect_to type_path
    else
      render :edit
    end
  end

  def edit
  end

  private

  def set_type
    @type = Type.find(params[:id])
  end

  def type_params
    params.require(:type).permit(:material, :remarks, :weight)
  end

end
