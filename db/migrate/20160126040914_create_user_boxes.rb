class CreateUserBoxes < ActiveRecord::Migration
  def change
    create_table :user_boxes do |t|
      t.references :user, index: true, foreign_key: true
      t.references :box, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
