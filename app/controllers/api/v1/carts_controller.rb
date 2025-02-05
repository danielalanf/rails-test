# frozen_string_literal: true

class Api::V1::CartsController < ApplicationController
  before_action :set_order

  def index
    @carts = @order.carts
    render json: @carts
  end

  def show
    @cart = @order.carts.find(params[:id])
    render json: @cart
  end

  private

  def set_order
    @order = Order.find(params[:order_id])
  end
end
