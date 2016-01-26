class AddBuyableToUserItems < ActiveRecord::Migration
  def change
    add_column :user_items, :imageable_id, :integer
    add_column :user_items, :imageable_type, :string

    add_index :user_items, :imageable_id
  end
end
