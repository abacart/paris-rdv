class UserBoxProduct < ActiveRecord::Base
  belongs_to :user_box
  belongs_to :product

  validate :user_box_is_not_full

  private
    def user_box_is_not_full
      errors.add(:box, "is full") if self.user_box.full?
    end
end
