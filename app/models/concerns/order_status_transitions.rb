# frozen_string_literal: true

module OrderStatusTransitions
  extend ActiveSupport::Concern

  included do
    # Incluindo o módulo AASM no modelo
    include AASM

    # Definindo os estados possíveis e transições
    aasm column: :status, enum: true do
      state :pending, initial: true   # Pedido criado, aguardando pagamento
      state :payment_failed           # Pagamento falhou
      state :paid                     # Pagamento confirmado
      state :processing               # Pedido sendo processado
      state :shipped                  # Pedido enviado
      state :out_for_delivery         # Pedido em rota de entrega
      state :delivered                # Pedido entregue
      state :returned                 # Pedido devolvido
      state :refunded                 # Pedido reembolsado

      # Definindo os eventos para transição de estado
      event :pay do
        transitions from: :pending, to: :paid
      end

      event :process do
        transitions from: :paid, to: :processing
      end

      event :ship do
        transitions from: :processing, to: :shipped
      end

      event :deliver do
        transitions from: :shipped, to: :delivered
      end

      event :return do
        transitions from: :delivered, to: :returned
      end

      event :refund do
        transitions from: :returned, to: :refunded
      end

      event :fail_payment do
        transitions from: :pending, to: :payment_failed
      end
    end
  end
end
