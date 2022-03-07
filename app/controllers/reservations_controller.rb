class ReservationsController < ApplicationController
  before_action :authenticate_user!, :find_cart_item, :reservation_params

  def index
    @reservations = Reservation.all
  end

  def show
    cart = current_user.prepare_cart
    @items = cart.items
    if @items.empty?
    redirect_to root_path, notice: 'カートは空です'
    end
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @cart_item = current_cart
    if @reservation.save
      redirect_to root_path
    else @cart_item.items.empty?
      redirect_to cart_path(current_user.prepare_cart)
    end
  end

  private

    def find_cart_item
      @item = Item.find(params[:id])
    end

    def reservation_params
      params.permit(:day, :time).merge(
        cart_item_item_id: params[:cart_item_item_id], user_id: current_user.id
      )
    end
end
