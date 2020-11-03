class AddlessesController < ApplicationController

  def create
  end


  private
  def comment_params
    params.require(:addless).permit(:order).merge(order_id: params[:order_id])
  end

end
