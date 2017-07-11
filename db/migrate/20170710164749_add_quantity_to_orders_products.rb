class AddQuantityToCarts < ActiveRecord::Migration[5.1]
  def change
    add_column :carts, :quantity, :integer
  end
end
