class CreateUserProducts < ActiveRecord::Migration
  def change
    create_table :user_products do |t|
      t.references :product, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :quantity, default: 0

      t.timestamps null: false
    end
  end
end
