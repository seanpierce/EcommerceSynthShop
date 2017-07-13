class Order < ApplicationRecord
  has_many :carts
  belongs_to :user
  # validates :status, :account_id, :total_price, :presence => true

  before_save :update_total
  before_create :update_status

  def calculate_total
    products = []
    self.carts.each do |item|
      products.push([Product.find(item.product_id), item.quantity])
    end
    products.collect { |product_info| product_info[0].price * product_info[1].to_i }.sum
  end

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

private

 def update_status
   if self.status == nil?
     self.status = "pending"
   end
 end

 def update_total
   self.total_price = calculate_total
 end

 validates :user_id, :presence => true

end
