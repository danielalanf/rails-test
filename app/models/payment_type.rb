# frozen_string_literal: true

class PaymentType < ApplicationRecord
  validates_presence_of :name, length: { maximum: 30 }
end
