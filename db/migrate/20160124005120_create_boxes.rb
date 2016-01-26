class CreateBoxes < ActiveRecord::Migration
  def change
    create_table :boxes do |t|
      t.references :category, index: true, foreign_key: true
      t.integer :max_size
      t.float :price

      t.timestamps null: false
    end
  end
end
