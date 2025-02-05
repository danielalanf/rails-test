# frozen_string_literal: true

class Cart < ApplicationRecord
  # include CartStatusTransitions  # Incluindo o concern para status

  # enum status: {
  #   active: 0,
  #   abandoned: 1,
  #   expired: 2,
  #   converted: 3,
  #   reserved: 4,
  #   failed_payment: 5
  # }

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

# Status do Cart (Pré-Compra)
# active → Carrinho aberto, cliente pode adicionar/remover itens.
# abandoned → Cliente saiu do site sem finalizar a compra (abandono de carrinho).
# expired → Carrinho expirado após um tempo sem ação.
# converted → O carrinho foi finalizado e virou um pedido (Order criada).
# Status do Cart (Se for um Checkout Parcial)
# Se o e-commerce permitir "reservar" produtos ou dividir pedidos em várias etapas:
# reserved → Produtos reservados, mas pagamento ainda não efetuado.
# failed_payment → Pagamento recusado, mas carrinho ainda disponível.
