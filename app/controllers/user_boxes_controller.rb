class UserBoxesController < ApplicationController
  def new
    @box = Box.find params[:box_id]
    @products = @box.category.products
    @user_box = current_user.user_boxes.find_or_create_by(box: @box, quantity: 0)
  end

  def add_product
    @user_box = UserBox.find params[:user_box_id]
    @product = Product.find params[:product_id]
    unless @user_box.full?
      UserBoxProduct.create(user_box: @user_box, product: @product)
    end
  end

  def remove_product
  end

  def destroy
  end
end
