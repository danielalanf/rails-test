# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :carts

  validates_presence_of :name, :value_in_cents

  def value
    value_in_cents - ((value_in_cents / 100) * (discount || 1))
  end
end
