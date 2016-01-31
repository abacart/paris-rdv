class Product < ActiveRecord::Base

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :picture, attachment_presence: true

  has_many :users, through: :user_products

  belongs_to :category

  scope :unboxable, -> {where.not(:price => nil)}


  has_attached_file :picture, styles: { medium: "300x300>" , thumb: "100x100>"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
end
