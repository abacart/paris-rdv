class AddQuantityToUserItems < ActiveRecord::Migration
  def change
    add_column :user_items, :quantity, :integer, default: 0
  end
end
