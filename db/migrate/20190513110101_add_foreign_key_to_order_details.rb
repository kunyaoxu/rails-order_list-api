class AddForeignKeyToOrderDetails < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :order_details, :products
    add_foreign_key :order_details, :orders
  end
end
