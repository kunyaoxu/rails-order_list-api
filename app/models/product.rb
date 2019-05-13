class Product < ApplicationRecord
  has_many :order_details
  has_many :orders, through: :order_details

  validates :inventory, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :sold, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :price, numericality: { greater_than_or_equal_to: 0, only_integer: true }
end
