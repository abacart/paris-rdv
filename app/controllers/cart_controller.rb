class CartController < ApplicationController
  before_action :authenticate_user!

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
    @user_item = UserItem.find params[:id]
    @item_name = @user_item.buyable.name
    current_user.user_items.delete(@user_item)
    redirect_to cart_index_path, notice: "#{@item_name} removed from the cart"
  end

  def remove_box
  end

  def index
    @user_product = current_user.user_products
    @user_box = current_user.user_boxes
  end
end
