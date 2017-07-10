class Product < ApplicationRecord
  has_many :orders_products
  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  # validates :price, :name, :description, :presence => true
end
