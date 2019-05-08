class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, :null => false
      t.integer :sold, :null => false, :default => 0
      t.integer :inventory, :null => false, :default => 0
      t.text :description

      t.timestamps
    end
  end
end
