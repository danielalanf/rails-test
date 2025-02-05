# frozen_string_literal: true

class Cart < ApplicationRecord
  include CartStatusTransitions  # Incluindo o concern para status

  enum status: {
    active: 0, # → Carrinho aberto, cliente pode adicionar/remover itens.
    abandoned: 1, # → Cliente saiu do site sem finalizar a compra (abandono de carrinho).
    expired: 2, # → Carrinho expirado após um tempo sem ação.
    converted: 3, # → O carrinho foi finalizado e virou um pedido (Order criada).
    reserved: 4, # → Produtos reservados, mas pagamento ainda não efetuado.
    failed_payment: 5 # → Pagamento recusado, mas carrinho ainda disponível.
  }

  belongs_to :product
  belongs_to :order

  before_create :set_initial_values

  private

  # Adiciona o status, valor do produto e total do carrinho
  def set_initial_values
    self.value_in_cents = product.value
    self.ammount_in_cents = self.quantity * self.value_in_cents
    self.status ||= :active
  end
end
