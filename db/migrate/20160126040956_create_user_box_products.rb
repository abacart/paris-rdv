class CreateUserBoxProducts < ActiveRecord::Migration
  def change
    create_table :user_box_products do |t|
      t.references :user_box, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
