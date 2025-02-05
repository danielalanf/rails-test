# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :carts

  scope :without_status, -> { where(status: nil) }
end
