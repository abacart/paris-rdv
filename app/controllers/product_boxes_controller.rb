class ProductBoxesController < ApplicationController
  def new
    @box = Box.find params[:box_id]
    @products = @box.category.products
  end

  def add_product
  end

  def remove_product
  end

  def destroy
  end
end
