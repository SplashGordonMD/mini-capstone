class OrdersController < ApplicationController
  def create
    @order = Order.new(
      user_id: params[:user_id],
      lemonaid_id: params[:lemonaid_id],
      quantity: params[:quantity],
      subtotal: params[:subtotal],
      tax: params[:tax],
      total: params[:total]
    )
    if @order.save
      redirect_to "/orders/#{@order.id}"
  else 
    render :new
    end
  end

  def show
    @order = Order.find_by(id: params[:id])
     
  end

end
