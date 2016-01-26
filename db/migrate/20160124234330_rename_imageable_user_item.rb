class RenameImageableUserItem < ActiveRecord::Migration
  def change

    remove_index :user_items, :imageable_id

    rename_column :user_items, :imageable_id, :buyable_id
    rename_column :user_items, :imageable_type, :buyable_type

    add_index :user_items, :buyable_id

  end
end
