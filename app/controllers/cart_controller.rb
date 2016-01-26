class CartController < ApplicationController
  before_action :authenticate_user!

  def add_product
    @product = Product.find params[:id]
    current_user.add_to_cart @product
    redirect_to @product, notice: "#{@product.name} added to the cart"
  end

  def add_box
    @box = Box.find params[:id]
    current_user.add_to_cart @box
    redirect_to @box, notice: "#{@box.name} added to the cart"
  end

  def remove_item
    @user_item = UserItem.find params[:id]
    @item_name = @user_item.buyable.name
    current_user.user_items.delete(@user_item)
    redirect_to cart_index_path, notice: "#{@item_name} removed from the cart"
  end

  def index
    @user_items = current_user.user_items
  end
end
