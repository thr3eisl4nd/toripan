class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :cart

  def sum_of_price
    item.price * quantity
  end
end