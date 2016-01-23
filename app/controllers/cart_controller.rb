class CartController < ApplicationController
  before_action :set_product, only: [:add_product, :remove_product]
  before_action :authenticate_user!

  def add_product
    current_user.add_to_cart @product
    redirect_to @product, notice: "#{@product.name} added to the cart"
  end

  def remove_product
    current_user.products.delete(@product)
    redirect_to cart_index_path, notice: "#{@product.name} removed from the cart"
  end

  def index
    @user_products = current_user.user_products
  end


  private

  def set_product
    @product = Product.find(params[:id])
  end

end
