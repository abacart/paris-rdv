class UserBoxProduct < ActiveRecord::Base
  belongs_to :user_box
  belongs_to :product
end
