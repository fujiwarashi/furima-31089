class OrdersController < ApplicationController

  def create
  end


  private
  def comment_params
    params.require(:order).permit(:user, :item).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  end
