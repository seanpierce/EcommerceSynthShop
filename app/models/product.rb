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

  def self.display_purchased_with(product)
    purchased_with = []
    freq = product.purchased_with.split(',').inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    purchased_with_ids = freq.sort_by { |key, value| value }.reverse[0..2]
    purchased_with_ids.each do |id|
      purchased_with.push(Product.find(id[0]))
    end

    purchased_with
  end
end
