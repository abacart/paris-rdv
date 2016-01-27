class Product < ActiveRecord::Base

  validates :name, presence: true
  validates :name, :price, uniqueness: true
  validates :picture, attachment_presence: true

  has_many :users, through: :user_items, as: :buyable

  belongs_to :category

  scope :unboxable, -> {where.not(:price => nil)}


  has_attached_file :picture, styles: { thumb: "300x300>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
end
