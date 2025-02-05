# frozen_string_literal: true

class CreateCarts < ActiveRecord::Migration[8.0]
  def change
    create_table :carts do |t|
      t.references :product, null: false
      t.references :order, null: false
      t.integer :quantity, null: false
      t.decimal :value_in_cents
      t.decimal :ammount_in_cents
      t.string :status
      t.timestamps
    end
  end
end
