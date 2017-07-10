class Order < ApplicationRecord
  has_many :orders_products
  # validates :status, :account_id, :total_price, :presence => true

  before_save :update_total
  before_create :update_status

  def calculate_total
    products = []
    self.orders_products.each do |item|
      products.push([Product.find(item.product_id), item.quantity])
    end
    products.collect { |product_info| product_info[0].price * product_info[1].to_i }.sum
  end

private

 def update_status
   if self.status == nil?
     self.status = "In progress"
   end
 end

 def update_total
   self.total_price = calculate_total
 end
end
