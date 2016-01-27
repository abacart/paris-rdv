class UserBox < ActiveRecord::Base
  belongs_to :user
  belongs_to :box

  has_many :user_box_products
  has_many :products, through: :user_box_products
  has_many :boxes

  delegate :name, to: :box


  def full?
    self.user_box_products.count >= self.box.size
  end

  def price
    self.box.price*self.quantity
  end

end
