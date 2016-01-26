class Product < ActiveRecord::Base

  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :users, through: :user_items, as: :buyable
  has_many :user_items, as: :buyable, dependent: :destroy

  belongs_to :category

  scope :unboxable, -> {where.not(:price => nil)}


  has_attached_file :picture, styles: { thumb: "300x300>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
end
