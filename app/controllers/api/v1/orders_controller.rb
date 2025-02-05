# frozen_string_literal: true

class Api::V1::OrdersController < ApiController
  def index
    @orders = Order.all
    render json: @orders
  end

  def show
    @order = Order.find_by(request_params)
    if @order
      render json: @order, status: :ok
    else
      render json: { error: :not_found }, status: :not_found
    end
  end

  private

  def request_params
    @request_params ||= validate_params(Api::V1::Orders::Show.new, params.to_unsafe_hash)
  end
end
