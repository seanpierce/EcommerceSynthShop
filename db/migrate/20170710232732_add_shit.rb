class AddShit < ActiveRecord::Migration[5.1]
  def change
    add_attachment :products, :image
  end
end
