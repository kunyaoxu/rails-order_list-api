class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]

  # GET /orders
  def index
    @orders = Orders.all

    render json: @orders
  end

  # GET /orders/1
  def show
    render json: @order
  end

  # POST /orders
  def create
    # {
    #   "product_ids": [1, 2, 3],
    #   "address": "test address 123",
    #   "name": "kun-yao",
    #   "email": "test@test.com"
    # }

    ActiveRecord::Base.transaction do
      @order = Order.new(
        name: params[:name],
        address: params[:address],
        email: params[:email]
      )

      params[:product_ids].each { |id|
        currentProduct = Product.find(id)
        currentProduct[:sold] += 1
        currentProduct[:inventory] -= 1
        currentProduct.save!
        newOrderDetail = OrderDetail.new(:product_id => id)
        @order.order_details.push(newOrderDetail)
      }

      if @order.save!
        render json: @order, status: :created
      else
        render json: @order.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end
end
