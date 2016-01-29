class CartController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:remove_product]
  before_action :set_box, only: [:remove_box]

  def add_product
    @product = Product.find(params[:id])
    UserProduct.find_or_create_by(product_id: @product.id, user_id: current_user.id).increment!(:quantity)
    redirect_to @product, notice: "#{@product.name} added to the cart"
  end

  def add_box
    @user_box = UserBox.find(params[:id])
    @user_box.increment!(:quantity)
    redirect_to @user_box.box, notice: "#{@user_box.box.name} added to the cart"
  end

  def remove_product
    destroy_item
  end

  def remove_box
    destroy_item
  end

  def index
    @user_products = current_user.user_products
    @user_boxes = current_user.user_boxes
  end

  private
    def destroy_item
      @item.destroy
      redirect_to cart_index_path, notice: "Item removed from the cart"
    end

    def set_product
      @item = UserProduct.find params[:id]
    end

    def set_box
      @item = UserBox.find params[:id]
    end
end
