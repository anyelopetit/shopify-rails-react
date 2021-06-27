# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_06_27_192653) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "line_items", force: :cascade do |t|
    t.integer "shopify_id"
    t.bigint "order_id", null: false
    t.bigint "variant_id", null: false
    t.string "title"
    t.float "price"
    t.integer "quantity"
    t.float "weight_quantity"
    t.string "weight_unit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_line_items_on_order_id"
    t.index ["variant_id"], name: "index_line_items_on_variant_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "shopify_id"
    t.jsonb "payment"
    t.jsonb "products"
    t.jsonb "origin"
    t.jsonb "sizes"
    t.string "kind"
    t.string "reference"
    t.jsonb "destiny"
    t.string "items"
    t.string "courier"
    t.integer "status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "shopify_id"
    t.string "title"
    t.string "vendor"
    t.string "product_type"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shopify_id"], name: "index_products_on_shopify_id"
  end

  create_table "shipments", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.integer "status"
    t.string "street"
    t.string "house_number"
    t.string "compliment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_shipments_on_order_id"
  end

  create_table "variants", force: :cascade do |t|
    t.integer "shopify_id"
    t.bigint "product_id", null: false
    t.string "title"
    t.float "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_variants_on_product_id"
  end

  add_foreign_key "line_items", "orders"
  add_foreign_key "line_items", "variants"
  add_foreign_key "shipments", "orders"
  add_foreign_key "variants", "products"
end
