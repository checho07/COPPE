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

ActiveRecord::Schema.define(version: 20180922193101) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "advisers", force: :cascade do |t|
    t.string "name_adviser"
    t.string "lastname_adviser"
    t.string "cc_adviser"
    t.string "email_adviser"
    t.float "phone_adviser"
    t.integer "age_adviser"
    t.integer "experience"
    t.bigint "area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_advisers_on_area_id"
  end

  create_table "areas", force: :cascade do |t|
    t.string "name_area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "course_types", force: :cascade do |t|
    t.string "modality_courseT"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entity_types", force: :cascade do |t|
    t.string "type_entity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "neighborhoods", force: :cascade do |t|
    t.string "name_neihg"
    t.string "zipCode_neigh"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name_role"
    t.string "desc_role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rols", force: :cascade do |t|
    t.string "name_rol"
    t.string "desc_rol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "advisers", "areas"
end
