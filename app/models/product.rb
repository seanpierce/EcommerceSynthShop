class Product < ApplicationRecord
  has_many :carts
  has_attached_file :image
  paginates_per 20
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :price, :name, :description, :presence => true

  def self.add_to_puchased_with(current_order)
    current_order.carts.each do |item, i|
      current_order.carts.each do |item_to_add, n|
        if i != n
          item.purchased_with << "#{item_to_add.id},"
        end
      end
      item.save
    end
  end
end
