class Change < ActiveRecord::Migration[5.1]
  def self.up
    rename_table :carts, :carts
  end

  def self.down
    rename_table :carts, :carts
  end
end
