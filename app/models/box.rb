class Box < ActiveRecord::Base
  belongs_to :category

  validates :name, :price, :size, presence: true
  validates :name, uniqueness: true

  has_many :users, through: :user_boxes
  has_many :user_boxes, dependent: :destroy

  has_attached_file :picture, styles: { medium: "300x300>" , thumb: "100x100>"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/

end
