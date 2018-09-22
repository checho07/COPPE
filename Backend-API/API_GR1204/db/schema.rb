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

ActiveRecord::Schema.define(version: 20180922165739) do

  create_table "advisers", force: :cascade do |t|
    t.string "name_adviser"
    t.string "lastname_adviser"
    t.string "cc_adviser"
    t.string "email_adviser"
    t.float "phone_adviser"
    t.integer "age_adviser"
    t.integer "experience"
    t.integer "area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_advisers_on_area_id"
  end

  create_table "advisories", force: :cascade do |t|
    t.string "type_advisory"
    t.integer "adviser_id"
    t.integer "project_id"
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

  create_table "companies", force: :cascade do |t|
    t.string "name_company"
    t.string "nit_company"
    t.string "address_company"
    t.string "email_company"
    t.float "phone_company"
    t.integer "entity_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_type_id"], name: "index_companies_on_entity_type_id"
  end

  create_table "companies_cities", force: :cascade do |t|
    t.integer "company_id"
    t.integer "city_id"
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
    t.integer "course_type_id"
    t.integer "area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_courses_on_area_id"
    t.index ["course_type_id"], name: "index_courses_on_course_type_id"
  end

  create_table "entity_types", force: :cascade do |t|
    t.string "type_entity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entrep_courses", force: :cascade do |t|
    t.integer "course_id"
    t.integer "entrepreneur_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_entrep_courses_on_course_id"
    t.index ["entrepreneur_id"], name: "index_entrep_courses_on_entrepreneur_id"
  end

  create_table "entrepreneurs", force: :cascade do |t|
    t.string "name_entre"
    t.string "lastname_entre"
    t.float "cc_entre"
    t.float "phone_entre"
    t.string "address_entre"
    t.integer "age_entre"
    t.string "email_entre"
    t.integer "neighborhood_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["neighborhood_id"], name: "index_entrepreneurs_on_neighborhood_id"
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
    t.integer "entrepreneur_id"
    t.integer "tutor_id"
    t.integer "area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_projects_on_area_id"
    t.index ["entrepreneur_id"], name: "index_projects_on_entrepreneur_id"
    t.index ["tutor_id"], name: "index_projects_on_tutor_id"
  end

  create_table "tutors", force: :cascade do |t|
    t.string "name_tutor"
    t.string "lastname_tutor"
    t.float "cc_tutor"
    t.float "phone_tutor"
    t.integer "age_tutor"
    t.string "email_tutor"
    t.integer "experence_tutor"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_tutors_on_company_id"
  end

end
