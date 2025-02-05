# frozen_string_literal: true

require "sidekiq-scheduler"

class MyJob < ApplicationJob
  def perform(*args)
    puts "INICIANDO JOB"
    CancelCart.new(find_cart_without_status).call
  end

  private

  def find_cart_without_status
    Cart.without_status.map(&:id)
  end
end
