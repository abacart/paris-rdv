class UserItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :buyable, polymorphic: true

  delegate :name, to: :buyable
  delegate :size, to: :buyable


  def price
    self.quantity*self.buyable.price
  end
end
