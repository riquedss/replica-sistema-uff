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

ActiveRecord::Schema[7.0].define(version: 2022_03_21_230255) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "class_enrollments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "college_class_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["college_class_id"], name: "index_class_enrollments_on_college_class_id"
    t.index ["user_id"], name: "index_class_enrollments_on_user_id"
  end

  create_table "college_classes", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "calendar"
    t.string "room"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "discipline_id", null: false
    t.bigint "user_id"
    t.bigint "department_id", null: false
    t.bigint "turns_id"
    t.bigint "class_enrollment_id"
    t.index ["class_enrollment_id"], name: "index_college_classes_on_class_enrollment_id"
    t.index ["department_id"], name: "index_college_classes_on_department_id"
    t.index ["discipline_id"], name: "index_college_classes_on_discipline_id"
    t.index ["turns_id"], name: "index_college_classes_on_turns_id"
    t.index ["user_id"], name: "index_college_classes_on_user_id"
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
  end

  create_table "disciplines", force: :cascade do |t|
    t.string "name"
    t.integer "hours"
    t.string "knowledge_area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "department_id", null: false
    t.index ["department_id"], name: "index_disciplines_on_department_id"
  end

  create_table "periods", force: :cascade do |t|
    t.integer "year"
    t.integer "semester"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "turns", force: :cascade do |t|
    t.bigint "users_id", null: false
    t.bigint "college_class_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["college_class_id"], name: "index_turns_on_college_class_id"
    t.index ["users_id"], name: "index_turns_on_users_id"
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
    t.bigint "turns_id"
    t.bigint "class_enrollment_id"
    t.index ["class_enrollment_id"], name: "index_users_on_class_enrollment_id"
    t.index ["turns_id"], name: "index_users_on_turns_id"
  end

  add_foreign_key "class_enrollments", "college_classes"
  add_foreign_key "class_enrollments", "users"
  add_foreign_key "college_classes", "class_enrollments"
  add_foreign_key "college_classes", "departments"
  add_foreign_key "college_classes", "disciplines"
  add_foreign_key "college_classes", "turns", column: "turns_id"
  add_foreign_key "college_classes", "users"
  add_foreign_key "disciplines", "departments"
  add_foreign_key "turns", "college_classes"
  add_foreign_key "turns", "users", column: "users_id"
  add_foreign_key "users", "class_enrollments"
  add_foreign_key "users", "turns", column: "turns_id"
end
