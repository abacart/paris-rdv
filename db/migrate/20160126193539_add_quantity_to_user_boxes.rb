class AddQuantityToUserBoxes < ActiveRecord::Migration
  def change
   add_column: :user_boxes, :quantity, :integer, default: 0
  end
end
