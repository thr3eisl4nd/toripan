class CartsController < ApplicationController
before_action :authenticate_user!


  def show
    cart = current_user.prepare_cart
    @items = cart.items
  end

end
