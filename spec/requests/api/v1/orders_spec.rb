require 'rails_helper'

RSpec.describe Api::V1::OrdersController, type: :controller do
  # Usaremos FactoryBot para criar pedidos em nossos testes
  let!(:orders) { create_list(:order, 3) }
  let!(:order) { orders.first }

  describe 'GET #index' do
    it 'returns a list of orders' do
      get :index

      # Verifica se o status HTTP da resposta é 200 OK
      expect(response.status).to eq(200)

      # Verifica se a resposta foi convertida para JSON corretamente
      expect(JSON.parse(response.body).size).to eq(3)
    end
  end

  describe 'GET #show' do
    it 'returns a single order' do
      get :show, params: { id: order.id }

      # Verifica se o status HTTP da resposta é 200 OK
      expect(response.status).to eq(200)

      # Verifica se a resposta contém o id da ordem
      expect(JSON.parse(response.body)['id']).to eq(order.id)
    end

    it 'returns a 404 if the order is not found' do
      get :show, params: { id: 'non-existent-id' }

      # Verifica se o status HTTP da resposta é 404 (Not Found)
      expect(response.status).to eq(404)
      expect(JSON.parse(response.body)['error']).to eq("not_found")
    end

    it 'returns a 400 if params is invalid' do
      get :show, params: { id: "" }

      # Verifica se o status HTTP da resposta é 400
      expect(response.status).to eq(400)
      expect(JSON.parse(response.body)["message"]).to eq("id deve ser preenchido")
    end
  end
end
