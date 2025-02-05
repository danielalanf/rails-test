# frozen_string_literal: true

class Cart < ApplicationRecord
  belongs_to :product
  belongs_to :order

  before_save :update_ammount

  scope :without_status, -> { where(status: nil) }

  private

  def update_ammount
    self.value_in_cents = product.value
    self.ammount_in_cents = self.quantity * self.value_in_cents
  end
end
