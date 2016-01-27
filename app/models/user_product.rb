class UserProduct < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  has_many :products
  has_many :users

  delegate :name, to: :product


  def price
    self.product.price*self.quantity
  end


end
