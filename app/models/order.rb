class Order < ApplicationRecord
  has_many :products, through: :order_items
  has_many :products
  belongs_to :account
  validates :status, :account_id, :total_price, :presence => true
end
