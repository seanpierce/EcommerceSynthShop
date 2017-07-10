class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.decimal :price
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
