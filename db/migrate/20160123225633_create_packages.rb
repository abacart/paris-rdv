class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string :name
      t.text :description
      t.float :price
      t.integer :category
      t.integer :size

      t.timestamps null: false
    end
  end
end
