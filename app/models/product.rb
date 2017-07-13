class Product < ApplicationRecord
  has_many :carts
  has_attached_file :image
  paginates_per 20
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :price, :name, :description, :presence => true
end
