class Product < ActiveRecord::Base

  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :users, through: :user_items, as: :buyable
  has_many :user_items, as: :buyable, dependent: :destroy

  belongs_to :category

  scope :unboxable, -> {where.not(:price => nil)}

end
