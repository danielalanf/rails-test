# frozen_string_literal: true

class Order < ApplicationRecord
  include OrderStatusTransitions  # Incluindo o concern para status

  enum status: {
    # Criação e Pagamento
    pending: 0, # → Criada, aguardando pagamento.
    payment_failed: 1, # → Pagamento recusado.
    paid: 2, # → Pagamento confirmado.
    # Processamento
    processing: 3, # → Pedido sendo processado pelo sistema.
    canceled: 4, # → Pedido cancelado antes do envio.
    # Envio e Entrega
    shipped: 5, # → Pedido enviado para o cliente.
    out_for_delivery: 6, # → Pedido saiu para entrega.
    delivered: 7, # → Pedido entregue ao cliente.
    # Pós-Entrega
    returned: 8, # → Cliente devolveu o pedido.
    refunded: 9 # → Reembolso processado.
  }

  has_many :carts, dependent: :destroy

  scope :without_status, -> { where(status: nil) }

  before_create :set_initial_status

  private

  def set_initial_status
    # Define o status inicial como 'pending' antes de criar a Order
    self.status ||= :pending
  end
end
