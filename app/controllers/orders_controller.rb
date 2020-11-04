class OrdersController < ApplicationController
  before_action :authenticate_user!


  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end


  private
  def order_params
    params.require(:order_address).permit(:user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

end