class Order < ApplicationRecord
  has_many :orders_products
  belongs_to :account
  validates :status, :account_id, :total_price, :presence => true
end
