class OrdersController < ApplicationController
  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order = @item.order.new(order_params)
    if @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :prefecture_id, :city, :address, :bulding, :phone_number).merge(user_id: current_user.id)
  end
end
