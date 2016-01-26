class BoxesController < ApplicationController
  before_action :set_box, only: [:show, :update, :destroy, :edit]

  def index
    @boxes = Box.all
  end

  def show
  end

  def edit
  end

  def update
    if @box.update(box_params)
      redirect_to admin_index_path, notice: 'Box updated'
    else
      flash[:alert] = "Couldn't update the box"
      render :edit
    end
  end

  def destroy
    @box.destroy
    redirect_to admin_index_path
  end

  def create
    @box = Box.new(box_params)
    if @box.save
      redirect_to admin_index_path, notice: 'Box created'
    else
      flash[:alert] = "Couldn't create the box"
      render :new
    end
  end

  def new
    @box = Box.new
  end


  private

  def box_params
    params.require(:box).permit(:name, :description, :size, :price, :category_id)
  end

  def set_box
    @box = Box.find(params[:id])
  end
end
