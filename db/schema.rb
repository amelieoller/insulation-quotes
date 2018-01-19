# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171108163344) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accessories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "accessories_quotes", id: false, force: :cascade do |t|
    t.bigint "quote_id", null: false
    t.bigint "accessory_id", null: false
    t.index ["accessory_id", "quote_id"], name: "index_accessories_quotes_on_accessory_id_and_quote_id"
    t.index ["quote_id", "accessory_id"], name: "index_accessories_quotes_on_quote_id_and_accessory_id"
  end

  create_table "applications", force: :cascade do |t|
    t.bigint "quote_id"
    t.string "application_type"
    t.string "description"
    t.integer "oc"
    t.string "framing"
    t.string "r_value"
    t.decimal "depth"
    t.decimal "length"
    t.decimal "width"
    t.decimal "height"
    t.string "vapor_barrier"
    t.integer "bags_needed"
    t.decimal "square_foot_price"
    t.boolean "manual_override"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quote_id"], name: "index_applications_on_quote_id"
  end

  create_table "applications_insulation_types", id: false, force: :cascade do |t|
    t.bigint "application_id", null: false
    t.bigint "insulation_type_id", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "street"
    t.string "city"
    t.integer "zip_code"
    t.string "state"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "insulation_types", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.decimal "coverage"
    t.integer "r_value"
    t.decimal "thickness"
    t.decimal "width"
    t.string "facing"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quotes", force: :cascade do |t|
    t.bigint "user_id"
    t.string "customer_name"
    t.string "street"
    t.string "city"
    t.integer "zip_code"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "customer_id"
    t.index ["customer_id"], name: "index_quotes_on_customer_id"
    t.index ["user_id"], name: "index_quotes_on_user_id"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "applications", "quotes"
  add_foreign_key "quotes", "users"
end
