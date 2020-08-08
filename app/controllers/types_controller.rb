class TypesController < ApplicationController
  #before_action :authenticate_user!
  before_action :set_type, only: [:show, :edit, :destroy, :update]

  def index
    @types = Type.all
  end

  def create
    #@list = List.find(params[:list_id])
    #@type = @list.types.build(type_params)
    @type = Type.new(type_params)
    if @type.save
      redirect_to types_path
    else
      render :new
    end
  end

  def new
    @type = Type.new
  end

  def show
  end

  def destroy
    if @type.destroy
      redirect_to types_path
    else
      render :index
    end
  end

  def update
    #list = List.find(params[:list_id])
    if @type.update(type_params)
      redirect_to type_path
    else
      render :edit
    end
  end

  def edit
    #@list = List.find(params[:list_id])
  end

  private

  def set_type
    @type = Type.find(params[:id])
  end

  def type_params
    params.require(:type).permit(:material, :remarks, :weight)
  end

end
