class AddPurchasedColumnToProds < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :purchased_with, :text
  end
end
