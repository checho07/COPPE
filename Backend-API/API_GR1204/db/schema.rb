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

ActiveRecord::Schema.define(version: 20180922211453) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "advisers", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_advisers_on_area_id"
    t.index ["user_id"], name: "index_advisers_on_user_id"
  end

  create_table "advisories", force: :cascade do |t|
    t.string "type_advisory"
    t.bigint "adviser_id"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["adviser_id"], name: "index_advisories_on_adviser_id"
    t.index ["project_id"], name: "index_advisories_on_project_id"
  end

  create_table "areas", force: :cascade do |t|
    t.string "name_area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "name_city"
    t.string "depart_city"
    t.string "zipCode_city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "name_company"
    t.string "nit_company"
    t.string "address_company"
    t.string "email_company"
    t.float "phone_company"
    t.bigint "entity_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_type_id"], name: "index_companies_on_entity_type_id"
  end

  create_table "companies_cities", force: :cascade do |t|
    t.bigint "company_id"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_companies_cities_on_city_id"
    t.index ["company_id"], name: "index_companies_cities_on_company_id"
  end

  create_table "course_types", force: :cascade do |t|
    t.string "modality_courseT"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string "name_cour"
    t.float "duration_cour"
    t.date "date_cour"
    t.string "link_cour"
    t.string "teacher_cour"
    t.bigint "course_type_id"
    t.bigint "area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_courses_on_area_id"
    t.index ["course_type_id"], name: "index_courses_on_course_type_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "name_doc"
    t.date "creationDate_doc"
    t.bigint "project_id"
    t.bigint "file_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["file_type_id"], name: "index_documents_on_file_type_id"
    t.index ["project_id"], name: "index_documents_on_project_id"
  end

  create_table "entity_types", force: :cascade do |t|
    t.string "type_entity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entrep_courses", force: :cascade do |t|
    t.bigint "course_id"
    t.bigint "entrepreneur_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_entrep_courses_on_course_id"
    t.index ["entrepreneur_id"], name: "index_entrep_courses_on_entrepreneur_id"
  end

  create_table "entrepreneurs", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "neighborhood_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["neighborhood_id"], name: "index_entrepreneurs_on_neighborhood_id"
    t.index ["user_id"], name: "index_entrepreneurs_on_user_id"
  end

  create_table "file_types", force: :cascade do |t|
    t.string "fileType"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "neighborhoods", force: :cascade do |t|
    t.string "name_neihg"
    t.string "zipCode_neigh"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "name_project"
    t.integer "progress_project"
    t.integer "numMembers__project"
    t.date "creationDate_project"
    t.date "finalDate_project"
    t.bigint "entrepreneur_id"
    t.bigint "tutor_id"
    t.bigint "area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_projects_on_area_id"
    t.index ["entrepreneur_id"], name: "index_projects_on_entrepreneur_id"
    t.index ["tutor_id"], name: "index_projects_on_tutor_id"
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

  create_table "tutors", force: :cascade do |t|
    t.bigint "company_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_tutors_on_company_id"
    t.index ["user_id"], name: "index_tutors_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "name_user"
    t.string "lastname_user"
    t.float "cc_user"
    t.integer "phone_user"
    t.integer "age_user"
    t.string "email_user"
    t.integer "experience_user"
    t.bigint "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "advisers", "areas"
  add_foreign_key "advisers", "users"
  add_foreign_key "advisories", "advisers"
  add_foreign_key "advisories", "projects"
  add_foreign_key "companies", "entity_types"
  add_foreign_key "companies_cities", "cities"
  add_foreign_key "companies_cities", "companies"
  add_foreign_key "courses", "areas"
  add_foreign_key "courses", "course_types"
  add_foreign_key "documents", "file_types"
  add_foreign_key "documents", "projects"
  add_foreign_key "entrep_courses", "courses"
  add_foreign_key "entrep_courses", "entrepreneurs"
  add_foreign_key "entrepreneurs", "neighborhoods"
  add_foreign_key "entrepreneurs", "users"
  add_foreign_key "projects", "areas"
  add_foreign_key "projects", "entrepreneurs"
  add_foreign_key "projects", "tutors"
  add_foreign_key "tutors", "companies"
  add_foreign_key "tutors", "users"
  add_foreign_key "users", "roles"
end
