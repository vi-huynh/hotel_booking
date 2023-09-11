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

ActiveRecord::Schema[7.0].define(version: 2023_09_11_062959) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "cancellations", id: false, force: :cascade do |t|
    t.bigserial "cancellation_id"
    t.bigint "reservation_id"
    t.text "reason"
    t.datetime "cancelled_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "guests", id: false, force: :cascade do |t|
    t.bigserial "guest_id"
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hotels", id: false, force: :cascade do |t|
    t.bigserial "hotel_id"
    t.string "name"
    t.string "address"
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "contact"
    t.string "phone"
    t.string "email"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "slug"
  end

  create_table "inventories", force: :cascade do |t|
    t.bigint "hotel_id"
    t.bigint "room_type_id"
    t.date "date"
    t.integer "total_inventory"
    t.integer "total_reserved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hotel_id", "room_type_id", "date"], name: "index_inventories_on_hotel_id_and_room_type_id_and_date", unique: true
  end

  create_table "payments", force: :cascade do |t|
    t.integer "reservation_id"
    t.integer "payment_method"
    t.decimal "amount"
    t.datetime "payment_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", id: false, force: :cascade do |t|
    t.bigserial "reservation_id"
    t.bigint "hotel_id"
    t.integer "room_type_id"
    t.bigint "guest_id"
    t.datetime "check_in_date"
    t.datetime "check_out_date"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number_room"
    t.string "booking_number"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource"
  end

  create_table "room_types", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.bigint "hotel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "hotel_id"], name: "index_room_types_on_name_and_hotel_id", unique: true
  end

  create_table "rooms", id: false, force: :cascade do |t|
    t.bigserial "room_id"
    t.bigint "room_type_id"
    t.bigint "hotel_id"
    t.boolean "is_available"
    t.string "rom_number"
    t.decimal "room_price"
    t.integer "bed_count"
    t.integer "room_max_occupancy"
    t.integer "max_adults_allowed"
    t.integer "max_children_allowed"
    t.text "room_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "rails"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

end
