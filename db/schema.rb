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

ActiveRecord::Schema[7.0].define(version: 2022_03_24_030640) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "college_classes", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "calendar"
    t.string "room"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "department_id"
    t.index ["department_id"], name: "index_college_classes_on_department_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "knowledge_area"
    t.string "code"
    t.string "campus"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.string "knowledge_area"
    t.string "code"
    t.string "campus"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_departments_on_user_id"
  end

  create_table "disciplines", force: :cascade do |t|
    t.string "name"
    t.integer "hours"
    t.string "knowlege_area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "department_id"
    t.index ["department_id"], name: "index_disciplines_on_department_id"
  end

  create_table "periods", force: :cascade do |t|
    t.integer "year"
    t.integer "semester"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "nacionality"
    t.string "state"
    t.string "rg"
    t.string "cpf"
    t.string "email"
    t.string "password_digest"
    t.date "birth_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "department_id"
    t.integer "kind"
    t.bigint "course_id"
    t.integer "address_number"
    t.string "street"
    t.string "district"
    t.string "address_complement"
    t.string "cep"
    t.string "phone"
    t.string "mobile"
    t.integer "registration_number"
    t.index ["course_id"], name: "index_users_on_course_id"
    t.index ["department_id"], name: "index_users_on_department_id"
  end

  add_foreign_key "college_classes", "departments"
  add_foreign_key "departments", "users"
  add_foreign_key "disciplines", "departments"
  add_foreign_key "users", "departments"
end
