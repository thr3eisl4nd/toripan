class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :cart
  has_many :reservations, dependent: :destroy

  def sum_of_price
    item.price * quantity
  end
end