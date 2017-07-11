class AssociateOrdersToUsers < ActiveRecord::Migration[5.1]
  def change
    drop_table :accounts
    remove_column :users, :account_id
    remove_column :orders, :account_id
    add_column :orders, :user_id, :integer
  end
end
