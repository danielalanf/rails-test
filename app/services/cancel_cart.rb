# frozen_string_literal: true

class CancelCart
  def initialize(ids)
    @ids = ids
  end

  def call
    ids.each do |id|
      cart = Cart.find id
      set_status(cart)
    end
  end

  private

  attr_accessor :ids

  def set_status(cart)
    cart.abandon!
  end
end
