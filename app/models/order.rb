class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  has_many :products, through: :products
end
