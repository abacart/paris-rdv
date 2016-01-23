class UserProduct < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  delegate :name, :price, to: :product
end
