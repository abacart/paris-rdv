class AddTimeOrders < ActiveRecord::Migration
  def change
    add_column :orders, :time_delivery, :string
  end
end
