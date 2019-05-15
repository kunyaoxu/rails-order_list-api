class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  has_many :products, through: :products

  validates :name, :address, :email, :order_details, length: {minimum:1}
end
