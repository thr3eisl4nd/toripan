class CartsController < ApplicationController
before_action :cart_item, only: [:add_item, :update_item, :delete_item]
before_action :cart_user
before_action :set_cart

  def show
    @items = @cart.items
  end

  def add_item
    @item = @cart.item.build(item_id: params[:item_id]) if @item.blank?
    @item.quantity += params[:quantity].to_i
    if @item.save
      redirect_to current_cart
    else
      redirect_to controller: "items", action: "show"
    end
  end

  def update_item
    @item.update(quantity: params[:quantity].to_i)
    redirect_to current_cart
  end

  def delete_item
    @cart.destroy
    redirect_to current_cart
  end

  private

  def cart_user
    @user = current_user
  end

  def cart_item
    @item = current_cart.items.find_by(item_id: params[item_id])
  end

  def set_cart
    @cart = current_cart
  end
end
