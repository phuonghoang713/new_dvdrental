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

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actors", id: :integer, default: -> { "nextval('actor_actor_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "first_name", limit: 45, null: false
    t.string "last_name", limit: 45, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.datetime "created_at"
    t.index ["last_name"], name: "idx_actor_last_name"
  end

  create_table "addresses", id: :integer, default: -> { "nextval('address_address_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "address", limit: 50, null: false
    t.string "address2", limit: 50
    t.string "district", limit: 20, null: false
    t.integer "city_id", limit: 2, null: false
    t.string "postal_code", limit: 10
    t.string "phone", limit: 20, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.datetime "created_at"
    t.index ["city_id"], name: "idx_fk_city_id"
  end

  create_table "category", id: :integer, default: -> { "nextval('category_category_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "name", limit: 25, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.datetime "created_at"
  end

  create_table "cities", id: :integer, default: -> { "nextval('city_city_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "city", limit: 50, null: false
    t.integer "country_id", limit: 2, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.datetime "created_at"
    t.index ["country_id"], name: "idx_fk_country_id"
  end

  create_table "countries", id: :integer, default: -> { "nextval('country_country_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "country", limit: 50, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.datetime "created_at"
  end

  create_table "customers", id: :integer, default: -> { "nextval('customer_customer_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer "store_id", limit: 2, null: false
    t.string "first_name", limit: 45, null: false
    t.string "last_name", limit: 45, null: false
    t.string "email", limit: 50
    t.integer "address_id", limit: 2, null: false
    t.boolean "activebool", default: true, null: false
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }
    t.integer "active"
    t.index ["address_id"], name: "idx_fk_address_id"
    t.index ["last_name"], name: "idx_last_name"
    t.index ["store_id"], name: "idx_fk_store_id"
  end

  create_table "film_category", primary_key: ["film_id", "category_id"], force: :cascade do |t|
    t.integer "film_id", limit: 2, null: false
    t.integer "category_id", limit: 2, null: false
    t.datetime "last_update", default: -> { "now()" }, null: false
  end

# Could not dump table "films" because of following StandardError
#   Unknown type 'mpaa_rating' for column 'rating'

  create_table "films_actors", primary_key: ["actor_id", "film_id"], force: :cascade do |t|
    t.integer "actor_id", limit: 2, null: false
    t.integer "film_id", limit: 2, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.datetime "created_at"
    t.index ["film_id"], name: "idx_fk_film_id"
  end

  create_table "inventories", id: :integer, default: -> { "nextval('inventory_inventory_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer "film_id", limit: 2, null: false
    t.integer "store_id", limit: 2, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.datetime "created_at"
    t.index ["store_id", "film_id"], name: "idx_store_id_film_id"
  end

  create_table "languages", id: :integer, default: -> { "nextval('language_language_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "name", limit: 20, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.datetime "created_at"
  end

  create_table "payments", id: :integer, default: -> { "nextval('payment_payment_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer "customer_id", limit: 2, null: false
    t.integer "staff_id", limit: 2, null: false
    t.integer "rental_id", null: false
    t.decimal "amount", precision: 5, scale: 2, null: false
    t.datetime "created_at", null: false
    t.index ["customer_id"], name: "idx_fk_customer_id"
    t.index ["rental_id"], name: "idx_fk_rental_id"
    t.index ["staff_id"], name: "idx_fk_staff_id"
  end

  create_table "rentals", id: :integer, default: -> { "nextval('rental_rental_id_seq'::regclass)" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "inventory_id", null: false
    t.integer "customer_id", limit: 2, null: false
    t.datetime "return_date"
    t.integer "staff_id", limit: 2, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.index ["created_at", "inventory_id", "customer_id"], name: "idx_unq_rental_rental_date_inventory_id_customer_id", unique: true
    t.index ["inventory_id"], name: "idx_fk_inventory_id"
  end

  create_table "staffs", id: :integer, default: -> { "nextval('staff_staff_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "first_name", limit: 45, null: false
    t.string "last_name", limit: 45, null: false
    t.integer "address_id", limit: 2, null: false
    t.string "email", limit: 50
    t.integer "store_id", limit: 2, null: false
    t.boolean "active", default: true, null: false
    t.string "username", limit: 16, null: false
    t.string "password", limit: 40
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.binary "picture"
    t.datetime "created_at"
  end

  create_table "stores", id: :integer, default: -> { "nextval('store_store_id_seq'::regclass)" }, force: :cascade do |t|
    t.integer "manager_staff_id", limit: 2, null: false
    t.integer "address_id", limit: 2, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.datetime "created_at"
    t.index ["manager_staff_id"], name: "idx_unq_manager_staff_id", unique: true
  end

  add_foreign_key "addresses", "cities", name: "fk_address_city"
  add_foreign_key "cities", "countries", name: "fk_city"
  add_foreign_key "customers", "addresses", name: "customer_address_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "film_category", "category", name: "film_category_category_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "film_category", "films", name: "film_category_film_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "films", "languages", name: "film_language_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "films_actors", "actors", name: "film_actor_actor_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "films_actors", "films", name: "film_actor_film_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "inventories", "films", name: "inventory_film_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "payments", "customers", name: "payment_customer_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "payments", "rentals", name: "payment_rental_id_fkey", on_update: :cascade, on_delete: :nullify
  add_foreign_key "payments", "staffs", name: "payment_staff_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "rentals", "customers", name: "rental_customer_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "rentals", "inventories", name: "rental_inventory_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "rentals", "staffs", name: "rental_staff_id_key"
  add_foreign_key "staffs", "addresses", name: "staff_address_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "stores", "addresses", name: "store_address_id_fkey", on_update: :cascade, on_delete: :restrict
  add_foreign_key "stores", "staffs", column: "manager_staff_id", name: "store_manager_staff_id_fkey", on_update: :cascade, on_delete: :restrict
end
