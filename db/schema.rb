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

ActiveRecord::Schema.define(version: 20170206075552) do

  create_table "batches", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "code"
    t.string   "name"
    t.boolean  "is_active",  default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "candidates", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "student_id"
    t.boolean  "medical_test_result",    default: false
    t.string   "medical_reason"
    t.string   "medical_doc"
    t.boolean  "sport_test_result",      default: false
    t.boolean  "is_key_student",         default: false
    t.boolean  "is_reserve_student",     default: false
    t.boolean  "is_scholarship_student", default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["is_key_student"], name: "index_candidates_on_is_key_student", using: :btree
    t.index ["is_reserve_student"], name: "index_candidates_on_is_reserve_student", using: :btree
    t.index ["is_scholarship_student"], name: "index_candidates_on_is_scholarship_student", using: :btree
    t.index ["student_id"], name: "index_candidates_on_student_id", using: :btree
  end

  create_table "interviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "code"
    t.datetime "interview_date"
    t.integer  "batch_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["batch_id"], name: "index_interviews_on_batch_id", using: :btree
  end

  create_table "interviews_students", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "student_id"
    t.integer  "interview_id"
    t.string   "result"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["result"], name: "index_interviews_students_on_result", using: :btree
    t.index ["student_id", "interview_id"], name: "index_interviews_students_on_student_id_and_interview_id", using: :btree
  end

  create_table "parents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "student_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "relation"
    t.string   "dob"
    t.string   "education"
    t.string   "occupation"
    t.string   "incom"
    t.string   "police_relatives"
    t.string   "country"
    t.string   "state"
    t.string   "city"
    t.string   "email"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "mobile"
    t.string   "company"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["student_id"], name: "index_parents_on_student_id", using: :btree
  end

  create_table "privileges", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "privileges_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "privilege_id"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["privilege_id", "user_id"], name: "index_privileges_users_on_privilege_id_and_user_id", using: :btree
  end

  create_table "students", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "registration_no"
    t.datetime "registration_date"
    t.string   "photo"
    t.string   "name"
    t.string   "father"
    t.string   "grand_father"
    t.string   "last_name"
    t.string   "tribe"
    t.integer  "batch_id"
    t.date     "birth_date"
    t.string   "birth_place"
    t.string   "nationality"
    t.string   "marital_status"
    t.string   "full_mother"
    t.string   "wife_nationality"
    t.string   "passport_number"
    t.date     "passport_issue_date"
    t.date     "passport_expiry_date"
    t.integer  "user_id"
    t.string   "passport_country"
    t.string   "passport_type"
    t.string   "e_id"
    t.string   "family_id"
    t.string   "family_head_id"
    t.string   "emirate_name"
    t.string   "home_address_emirate"
    t.string   "home_address_city"
    t.string   "home_address_area"
    t.string   "home_address_building"
    t.string   "home_address_pobox"
    t.string   "home_address_phone"
    t.string   "mobile1"
    t.string   "mobile2"
    t.string   "email"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.string   "language"
    t.string   "other_languages"
    t.string   "religion"
    t.string   "doctrine"
    t.integer  "tallness"
    t.integer  "weight"
    t.string   "mother_nationality"
    t.string   "mother_tribe"
    t.string   "mother_grand_father"
    t.string   "mother_father"
    t.integer  "year_high_shcool_diploma"
    t.string   "edu_section"
    t.string   "school_name"
    t.string   "grades_rate"
    t.string   "achievements"
    t.string   "kid_cop"
    t.string   "scouts"
    t.string   "scholarship"
    t.string   "remarks"
    t.integer  "exam_grade"
    t.string   "military_service"
    t.string   "remark_for_military_service"
    t.boolean  "fired_from_other_colleges"
    t.string   "criminal_status"
    t.boolean  "is_registered"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["batch_id"], name: "index_students_on_batch_id", using: :btree
    t.index ["created_by"], name: "index_students_on_created_by", using: :btree
    t.index ["name"], name: "index_students_on_name", using: :btree
    t.index ["registration_no"], name: "index_students_on_registration_no", using: :btree
    t.index ["updated_by"], name: "index_students_on_updated_by", using: :btree
    t.index ["user_id"], name: "index_students_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "username"
    t.string   "hashed_password"
    t.string   "full_name"
    t.integer  "student_id"
    t.boolean  "is_student",      default: false
    t.boolean  "is_employee",     default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["student_id"], name: "index_users_on_student_id", using: :btree
  end

end
