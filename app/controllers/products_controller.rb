class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy, :edit]
  before_action :authenticate_admin!, except: [:show, :index]

  def index
    @products = Product.all
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to admin_index_path, notice: 'Product updated'
    else
      flash[:alert] = "Couldn't update the product"
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to admin_index_path
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_index_path, notice: 'Product created'
    else
      flash[:alert] = "Couldn't create the product"
      render :new
    end
  end

  def new
    @product = Product.new
  end


  private

  def product_params
    params.require(:product).permit(:name, :picture, :description, :price, :category_id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
