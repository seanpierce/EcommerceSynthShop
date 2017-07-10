class AddQuantityToOrdersProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :orders_products, :quantity, :integer
  end
end
