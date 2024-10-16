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

ActiveRecord::Schema[7.1].define(version: 2024_09_10_113754) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.integer "user_id"
    t.integer "clothing_id"
    t.string "status"
    t.date "reservation_date"
    t.date "modification_date"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clothings", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "price"
    t.string "available_sizes"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "order_id"
    t.index ["order_id"], name: "index_clothings_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "clothing_id"
    t.integer "quantity"
    t.date "order_date"
    t.string "delivery_address"
    t.text "order_notes"
    t.string "status"
    t.string "estimated_delivery_date"
    t.string "payment_status"
    t.integer "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders_managements", force: :cascade do |t|
    t.bigint "order_id"
    t.string "status"
    t.string "priority"
    t.date "start_date"
    t.date "end_date"
    t.text "notes"
    t.date "last_updated"
    t.string "is_urgent"
    t.text "task_list"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["order_id"], name: "index_orders_managements_on_order_id"
    t.index ["user_id"], name: "index_orders_managements_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.integer "rating"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "clothing_id"
    t.index ["clothing_id"], name: "index_reviews_on_clothing_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "clothings"
  add_foreign_key "bookings", "users"
  add_foreign_key "clothings", "orders"
  add_foreign_key "orders", "clothings"
  add_foreign_key "orders", "users"
  add_foreign_key "orders_managements", "orders"
  add_foreign_key "orders_managements", "users"
  add_foreign_key "reviews", "clothings"
end
