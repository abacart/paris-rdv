class ItemsController < ApplicationController
  def index
    @products = Product.all
    @boxes = Box.all
  end


end
