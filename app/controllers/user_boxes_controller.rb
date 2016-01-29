class UserBoxesController < ApplicationController
  before_action :authenticate_user!

  def new
    @box = Box.find params[:box_id]
    @products = @box.category.products
    @user_box = current_user.user_boxes.find_or_create_by(box: @box, quantity: 0)
  end

  def add_product
    @user_box = UserBox.find params[:user_box_id]
    @product = Product.find params[:product_id]
    UserBoxProduct.create(user_box: @user_box, product: @product)
    render :refresh_user_box_list
  end

  def remove_product
    @user_box = UserBox.find params[:user_box_id]
    @product = Product.find params[:product_id]
    if ubp = UserBoxProduct.find_by(user_box: @user_box, product: @product)
      ubp.destroy
    end
    render :refresh_user_box_list
  end

  def destroy
  end
end
