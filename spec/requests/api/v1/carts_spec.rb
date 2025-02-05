require 'rails_helper'

RSpec.describe "Api::V1::Carts", type: :request do
  let!(:order) { Order.create!(status: "pending") }
  let!(:carts) { create_list(:cart, 3, order: order) }

  describe "GET /api/v1/orders/:order_id/carts" do
    it "retorna todos os carts da order" do
      get "/api/v1/orders/#{order.id}/carts"

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end

  describe "GET /api/v1/orders/:order_id/carts/:id" do
    it "retorna um cart específico" do
      cart = carts.first
      get "/api/v1/orders/#{order.id}/carts/#{cart.id}"

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)["id"]).to eq(cart.id)
    end

    it "retorna 404 se o cart não existir" do
      get "/api/v1/orders/#{order.id}/carts/9999"

      expect(response).to have_http_status(:not_found)
    end
  end
end
