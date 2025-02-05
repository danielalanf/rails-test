# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.integer :quantity
      t.decimal :ammount_in_cents
      t.string :status
      t.references :payment_type
      t.timestamps
    end
  end
end
