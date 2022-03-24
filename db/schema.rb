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

ActiveRecord::Schema[7.0].define(version: 2022_03_23_222105) do
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
    t.bigint "class_enrollment_id"
    t.integer "spots"
    t.index ["class_enrollment_id"], name: "index_college_classes_on_class_enrollment_id"
    t.index ["department_id"], name: "index_college_classes_on_department_id"
    t.index ["discipline_id"], name: "index_college_classes_on_discipline_id"
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
    t.bigint "user_id"
    t.index ["user_id"], name: "index_departments_on_user_id"
  end

  create_table "dependencies", force: :cascade do |t|
    t.integer "requirement_id"
    t.integer "target_id"
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
    t.bigint "lectures_id"
    t.bigint "dependency_id"
    t.index ["department_id"], name: "index_disciplines_on_department_id"
    t.index ["dependency_id"], name: "index_disciplines_on_dependency_id"
    t.index ["lectures_id"], name: "index_disciplines_on_lectures_id"
  end

  create_table "grades", force: :cascade do |t|
    t.bigint "professor_id"
    t.bigint "student_id"
    t.float "primeira_nota"
    t.float "segunda_nota"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "college_class_id", null: false
    t.index ["college_class_id"], name: "index_grades_on_college_class_id"
    t.index ["professor_id"], name: "index_grades_on_professor_id"
    t.index ["student_id"], name: "index_grades_on_student_id"
  end

  create_table "lectures", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "discipline_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discipline_id"], name: "index_lectures_on_discipline_id"
    t.index ["user_id"], name: "index_lectures_on_user_id"
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
    t.integer "kind"
    t.bigint "class_enrollment_id"
    t.index ["class_enrollment_id"], name: "index_users_on_class_enrollment_id"
    t.index ["course_id"], name: "index_users_on_course_id"
    t.index ["department_id"], name: "index_users_on_department_id"
  end

  add_foreign_key "class_enrollments", "college_classes"
  add_foreign_key "class_enrollments", "users"
  add_foreign_key "college_classes", "class_enrollments"
  add_foreign_key "college_classes", "departments"
  add_foreign_key "college_classes", "disciplines"
  add_foreign_key "college_classes", "users"
  add_foreign_key "disciplines", "departments"
  add_foreign_key "disciplines", "dependencies"
  add_foreign_key "disciplines", "lectures", column: "lectures_id"
  add_foreign_key "grades", "college_classes"
  add_foreign_key "grades", "users", column: "professor_id"
  add_foreign_key "grades", "users", column: "student_id"
  add_foreign_key "lectures", "disciplines"
  add_foreign_key "lectures", "users"
  add_foreign_key "users", "class_enrollments"
end
