# frozen_string_literal: true

class Order < ApplicationRecord
  # include OrderStatusTransitions  # Incluindo o concern para status

  # enum status: {
  #   pending: 0,
  #   payment_failed: 1,
  #   paid: 2,
  #   processing: 3,
  #   canceled: 4,
  #   shipped: 5,
  #   out_for_delivery: 6,
  #   delivered: 7,
  #   returned: 8,
  #   refunded: 9
  # }

  has_many :carts, dependent: :destroy

  before_create :set_initial_status

  private

  def set_initial_status
    # Define o status inicial como 'pending' antes de criar a Order
    self.status ||= :pending
  end
end

# Criação e Pagamento
# pending → Criada, aguardando pagamento.
# payment_failed → Pagamento recusado.
# paid → Pagamento confirmado.
# Processamento
# processing → Pedido sendo processado pelo sistema.
# canceled → Pedido cancelado antes do envio.
# Envio e Entrega
# shipped → Pedido enviado para o cliente.
# out_for_delivery → Pedido saiu para entrega.
# delivered → Pedido entregue ao cliente.
# Pós-Entrega
# returned → Cliente devolveu o pedido.
# refunded → Reembolso processado.
