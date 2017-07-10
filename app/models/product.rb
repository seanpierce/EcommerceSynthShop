class Product < ApplicationRecord
  has_many :orders, through: :order_items
  has_many :orders

  validates :price, :name, :description, :presence => true
end
