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

ActiveRecord::Schema.define(version: 2021_12_17_084150) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "departments", force: :cascade do |t|
    t.bigint "factory_id", null: false
    t.string "chief_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["factory_id"], name: "index_departments_on_factory_id"
  end

  create_table "factories", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "director_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "parts", force: :cascade do |t|
    t.string "name"
    t.bigint "product_id", null: false
    t.integer "weight"
    t.string "dimensions"
    t.bigint "vendor_id", null: false
    t.date "ship_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_parts_on_product_id"
    t.index ["vendor_id"], name: "index_parts_on_vendor_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "factory_id", null: false
    t.bigint "department_id", null: false
    t.bigint "technology_id", null: false
    t.string "name"
    t.string "designation"
    t.integer "weight"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["department_id"], name: "index_products_on_department_id"
    t.index ["factory_id"], name: "index_products_on_factory_id"
    t.index ["technology_id"], name: "index_products_on_technology_id"
  end

  create_table "technologies", force: :cascade do |t|
    t.text "description"
    t.string "developer"
    t.integer "duration"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vendors", force: :cascade do |t|
    t.string "name"
    t.string "region"
    t.string "address"
    t.string "director_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "departments", "factories"
  add_foreign_key "parts", "products"
  add_foreign_key "parts", "vendors"
  add_foreign_key "products", "departments"
  add_foreign_key "products", "factories"
  add_foreign_key "products", "technologies"
end
