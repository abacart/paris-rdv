class Box < ActiveRecord::Base
  belongs_to :category

  validates :name, :price, :size, presence: true
  validates :name, uniqueness: true

  has_many :users, through: :user_items, as: :buyable
  has_many :user_items, as: :buyable, dependent: :destroy

end
