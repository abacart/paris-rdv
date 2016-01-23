class User < ActiveRecord::Base
  has_many :user_products, dependent: :destroy
  has_many :products, through: :user_products

  def total_cart
    self.products.collect(&:price).sum
  end

  def add_to_cart(product)
    self.user_products.find_or_create_by(product: product).increment!(:quantity)
  end
end



