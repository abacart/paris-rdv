class AddNameToBox < ActiveRecord::Migration
  def change
    add_column :boxes, :name, :string
    rename_column :boxes, :max_size, :size
  end
end
