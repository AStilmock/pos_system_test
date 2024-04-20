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

ActiveRecord::Schema[7.0].define(version: 2024_04_19_040307) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "discounts", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.string "description"
    t.integer "price_percent"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.integer "phone"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_employees_on_user_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.datetime "date_time"
    t.bigint "user_id", null: false
    t.bigint "item_id", null: false
    t.integer "quantity"
    t.bigint "discount_id", null: false
    t.integer "sub_total_sale_price"
    t.integer "final_sale_price"
    t.boolean "complete"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discount_id"], name: "index_invoices_on_discount_id"
    t.index ["item_id"], name: "index_invoices_on_item_id"
    t.index ["user_id"], name: "index_invoices_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "unit_price"
    t.integer "item_cost"
    t.integer "quantity"
    t.boolean "in_stock"
    t.bigint "product_category_id", null: false
    t.bigint "discount_id", null: false
    t.bigint "vendor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discount_id"], name: "index_items_on_discount_id"
    t.index ["product_category_id"], name: "index_items_on_product_category_id"
    t.index ["vendor_id"], name: "index_items_on_vendor_id"
  end

  create_table "product_categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchase_orders", force: :cascade do |t|
    t.string "description"
    t.datetime "date_time"
    t.bigint "vendor_id", null: false
    t.bigint "item_id", null: false
    t.integer "quantity"
    t.integer "complete"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_purchase_orders_on_item_id"
    t.index ["user_id"], name: "index_purchase_orders_on_user_id"
    t.index ["vendor_id"], name: "index_purchase_orders_on_vendor_id"
  end

  create_table "sales", force: :cascade do |t|
    t.datetime "date_time"
    t.bigint "invoice_id", null: false
    t.bigint "discount_id", null: false
    t.bigint "user_id", null: false
    t.integer "sub_total_sale_price"
    t.integer "shipping"
    t.integer "taxes"
    t.integer "total_sale_price"
    t.integer "complete"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discount_id"], name: "index_sales_on_discount_id"
    t.index ["invoice_id"], name: "index_sales_on_invoice_id"
    t.index ["user_id"], name: "index_sales_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.integer "permission"
    t.integer "discount_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vendors", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "address"
    t.string "email"
    t.integer "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "employees", "users"
  add_foreign_key "invoices", "discounts"
  add_foreign_key "invoices", "items"
  add_foreign_key "invoices", "users"
  add_foreign_key "items", "discounts"
  add_foreign_key "items", "product_categories"
  add_foreign_key "items", "vendors"
  add_foreign_key "purchase_orders", "items"
  add_foreign_key "purchase_orders", "users"
  add_foreign_key "purchase_orders", "vendors"
  add_foreign_key "sales", "discounts"
  add_foreign_key "sales", "invoices"
  add_foreign_key "sales", "users"
end
