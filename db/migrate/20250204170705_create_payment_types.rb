# frozen_string_literal: true

class CreatePaymentTypes < ActiveRecord::Migration[8.0]
  def change
    create_table :payment_types do |t|
      t.string :name, null: false, limit: 30
      t.timestamps
    end
  end
end
