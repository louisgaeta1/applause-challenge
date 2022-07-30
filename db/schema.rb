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

ActiveRecord::Schema.define(version: 2022_07_29_200911) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bugs", force: :cascade do |t|
    t.bigint "testers_id", null: false
    t.bigint "devices_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["devices_id"], name: "index_bugs_on_devices_id"
    t.index ["testers_id"], name: "index_bugs_on_testers_id"
  end

  create_table "devices", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "testers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "country"
    t.datetime "last_login"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "testers_devices", force: :cascade do |t|
    t.bigint "testers_id", null: false
    t.bigint "devices_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["devices_id"], name: "index_testers_devices_on_devices_id"
    t.index ["testers_id"], name: "index_testers_devices_on_testers_id"
  end

  add_foreign_key "bugs", "devices", column: "devices_id"
  add_foreign_key "bugs", "testers", column: "testers_id"
  add_foreign_key "testers_devices", "devices", column: "devices_id"
  add_foreign_key "testers_devices", "testers", column: "testers_id"
end
