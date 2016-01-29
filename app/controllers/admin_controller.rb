class AdminController < ApplicationController
  before_action :authenticate_admin!

  def index
    @products = Product.all
    @boxes = Box.all
  end

end
