class AddPriceToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :price, :integer, :null => false, :default => 0
  end
end
