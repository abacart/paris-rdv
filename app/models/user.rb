class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_boxes, dependent: :destroy
  has_many :user_products, dependent: :destroy
  has_many :orders



  def total_cart
    t_products = self.user_products.collect(&:price).sum
    t_boxes = self.user_boxes.collect(&:price).sum
    t_products+t_boxes
  end

end



