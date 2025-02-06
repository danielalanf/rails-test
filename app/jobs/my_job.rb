# frozen_string_literal: true

require "sidekiq-scheduler"

class MyJob < ApplicationJob
  def perform(*args)
    puts " ----- INICIANDO JOB ----- "
    CancelCart.new(find_cart_inactive).call
  end

  private

  def find_cart_inactive
    Cart.inactive.map(&:id)
  end
end
