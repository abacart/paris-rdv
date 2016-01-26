class AddDescriptionToBox < ActiveRecord::Migration
  def change
    add_column :boxes, :description, :text
  end
end
