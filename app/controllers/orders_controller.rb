class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  
  def index
    @sold_out_order = SoldOutOrder.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @sold_out_order = SoldOutOrder.new(order_params)
    if @sold_out_order.valid?
      pay_item
      @sold_out_order.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:sold_out_order).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end


end
