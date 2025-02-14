# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_02_06_184858) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "carts", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "order_id", null: false
    t.integer "quantity", null: false
    t.integer "value_in_cents"
    t.integer "ammount_in_cents"
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_carts_on_order_id"
    t.index ["product_id"], name: "index_carts_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "quantity"
    t.integer "ammount_in_cents"
    t.integer "status", default: 0, null: false
    t.bigint "payment_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payment_type_id"], name: "index_orders_on_payment_type_id"
  end

  create_table "payment_types", force: :cascade do |t|
    t.string "name", limit: 30, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.string "description"
    t.integer "value_in_cents", null: false
    t.integer "discount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
