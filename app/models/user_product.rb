class UserProduct < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  delegate :name, to: :product

  def price
    self.quantity*self.product.price
  end
end
