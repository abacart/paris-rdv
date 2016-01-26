class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_items, dependent: :destroy
  has_many :buyable, through: :user_items, source_type: "Buyable"



  def total_cart
    self.user_items.collect(&:price).sum
  end

  def add_to_cart(buyable)
    self.user_items.find_or_create_by(buyable: buyable).increment!(:quantity)
  end
end



