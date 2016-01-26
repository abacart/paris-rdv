class UserBox < ActiveRecord::Base
  belongs_to :user
  belongs_to :box
end
