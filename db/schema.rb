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

ActiveRecord::Schema[7.1].define(version: 2023_12_18_095304) do
  create_table "schools", force: :cascade do |t|
    t.string "schoolName"
    t.string "board"
    t.string "principalName"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sclasses", force: :cascade do |t|
    t.integer "classNumber"
    t.string "department"
    t.string "division"
    t.integer "school_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_sclasses_on_school_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "rollNumber"
    t.string "studentClass"
    t.string "fatherName"
    t.integer "sclass_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sclass_id"], name: "index_students_on_sclass_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "contactNumber"
    t.integer "sclass_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sclass_id"], name: "index_teachers_on_sclass_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "sclasses", "schools"
  add_foreign_key "students", "sclasses"
  add_foreign_key "teachers", "sclasses"
end
