class Product < ActiveRecord::Base
  validates :name, :price, presence: true
  validates :name, uniqueness: true

  has_many :user_products, dependent: :destroy
  has_many :users, through: :user_products
end
