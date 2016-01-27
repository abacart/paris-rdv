class ShopController < ApplicationController


  def index
    @boxes = Box.all
    @products = Product.all
  end


end
