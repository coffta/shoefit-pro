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

ActiveRecord::Schema[7.0].define(version: 2023_08_29_070029) do
  create_table "customers", charset: "utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "customer_name", null: false
    t.string "customer_address"
    t.date "date_of_birth"
    t.string "customer_phone_number"
    t.string "customer_email"
    t.string "occupation"
    t.string "customer_gender"
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "shoe_sizes", charset: "utf8", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.integer "calculated_length", null: false
    t.string "gender", null: false
    t.string "toe_shape", null: false
    t.integer "foot_length_left", null: false
    t.integer "foot_length_right", null: false
    t.integer "foot_girth_load_left", null: false
    t.integer "foot_girth_load_right", null: false
    t.integer "foot_girth_nonload_left", null: false
    t.integer "foot_girth_nonload_right", null: false
    t.integer "foot_width_load_left", null: false
    t.integer "foot_width_load_right", null: false
    t.integer "foot_width_nonload_left", null: false
    t.integer "foot_width_nonload_right", null: false
    t.string "calculated_width_load_right", null: false
    t.string "calculated_width_load_left", null: false
    t.string "calculated_girth_load_right", null: false
    t.string "calculated_girth_load_left", null: false
    t.string "calculated_width_nonload_right", null: false
    t.string "calculated_width_nonload_left", null: false
    t.string "calculated_girth_nonload_right", null: false
    t.string "calculated_girth_nonload_left", null: false
    t.date "foot_measured_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_shoe_sizes_on_customer_id"
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "nickname", null: false
    t.string "name", null: false
    t.string "address", null: false
    t.string "phone_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "customers", "users"
  add_foreign_key "shoe_sizes", "customers"
end
