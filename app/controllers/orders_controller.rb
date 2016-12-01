class OrdersController < ApplicationController
  def create
    @carted_products = current_user.carted_products.where(status: "carted")

    calculated_subtotal = 0
    @carted_products.each do |carted_product|
      calculated_subtotal += carted_product.quantity * carted_product.product.price
    end
    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_subtotal + calculated_tax

    order = Order.new(
      user_id: params[:user_id],
      lemonaid_id: params[:lemonaid_id],
      quantity: params[:quantity],
      subtotal: params[:subtotal],
      tax: params[:tax],
      total: params[:total]
      )

    order.save

    #@carted_products.each d0 |carted_products|
    #   carted_product.status = "purchased"
    #   carted_product.order_id = order.id
    #   carted_product.save
    # end
    @carted_products.update_all(status: "purchased", order_id: order.id)
      
      redirect_to "/orders/#{@order.id}"
    end

  def show
    @order = Order.find_by(id: params[:id])
    render 'show.html.erb'
  end
end

