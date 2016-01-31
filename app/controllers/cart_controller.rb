class CartController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:remove_product, :increase_product_quantity, :decrease_product_quantity]
  before_action :set_box, only: [:remove_box, :increase_box_quantity, :decrease_box_quantity]

  def add_product
    @product = Product.find(params[:id])
    UserProduct.find_or_create_by(product_id: @product.id, user_id: current_user.id).increment!(:quantity)
    redirect_to @product, notice: "#{@product.name} added to the cart"
  end

  def add_box
    @user_box = UserBox.find(params[:id])
    @user_box.increment!(:quantity)
    redirect_to cart_index_path, notice: "#{@user_box.box.name} added to the cart"
  end

  def update_box
    @user_box = UserBox.find(params[:id])
    redirect_to cart_index_path, notice: "#{@user_box.box.name} updated"
  end

  def remove_product
    destroy_item
  end

  def remove_box
    destroy_item
  end


  def increase_product_quantity
    increase_item_quantity
  end

  def decrease_product_quantity
    decrease_item_quantity
  end

  def increase_box_quantity
    increase_item_quantity
  end

  def decrease_box_quantity
    decrease_item_quantity
  end


  def index
    @user_products = current_user.user_products
    @user_boxes = current_user.user_boxes.where.not(quantity: 0)
    @invoice = (@user_boxes + @user_products).map{|item| "#{item.name} x #{item.quantity} #{item.price}" }
  end



  private
    def destroy_item
      @item.destroy
      redirect_to cart_index_path, notice: "Item removed from the cart"
    end

    def increase_item_quantity
      @item.increment!(:quantity)
      redirect_to cart_index_path
    end

    def decrease_item_quantity
      if @item.quantity > 1
        @item.decrement!(:quantity)
      end
      redirect_to cart_index_path
    end

    def set_product
      @item = UserProduct.find params[:id]
    end

    def set_box
      @item = UserBox.find params[:id]
    end
end
