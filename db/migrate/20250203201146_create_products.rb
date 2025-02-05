# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name, null: false, limit: 100
      t.string :description
      t.integer :value_in_cents, null: false
      t.integer :discount
      t.timestamps
    end
  end
end
