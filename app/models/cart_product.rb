class CartProduct < ApplicationRecord
  belongs_to :product
	belongs_to :customer

	validates :customer_id, :product_id, :amount, presence: true
	validates :amount, numericality: { only_integer: true }
end
