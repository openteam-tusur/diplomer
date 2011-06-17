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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110617054408) do

  create_table "chairs", :force => true do |t|
    t.text     "title"
    t.string   "abbr"
    t.text     "eng_title"
    t.string   "eng_abbr"
    t.integer  "faculty_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "diplomas", :force => true do |t|
    t.integer  "speciality_id"
    t.string   "number"
    t.date     "admission_date"
    t.date     "graduation_date"
    t.string   "study_form"
    t.string   "study_duration"
    t.integer  "total_hours"
    t.integer  "contact_hours"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "chair_id"
    t.string   "eng_number"
    t.integer  "serial_number"
  end

  create_table "disciplines", :force => true do |t|
    t.text     "title"
    t.text     "eng_title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "faculties", :force => true do |t|
    t.text     "title"
    t.text     "eng_title"
    t.string   "abbr"
    t.string   "eng_abbr"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "chief_post"
    t.string   "chief_name"
  end

  create_table "people", :force => true do |t|
    t.string   "surname"
    t.string   "firstname"
    t.string   "patrynomic"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "programm_items", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "grade"
    t.float    "credits"
    t.integer  "hours"
    t.integer  "weeks"
    t.string   "type"
    t.integer  "discipline_id"
    t.integer  "context_id"
    t.text     "title"
    t.text     "eng_title"
    t.integer  "position"
    t.string   "context_type"
  end

  create_table "roles", :force => true do |t|
    t.string   "type"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "faculty_id"
    t.integer  "chair_id"
  end

  create_table "specialities", :force => true do |t|
    t.string   "code"
    t.text     "title"
    t.text     "eng_title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "qualification"
    t.string   "eng_qualification"
  end

  create_table "students", :force => true do |t|
    t.string   "surname"
    t.string   "firstname"
    t.string   "patrynomic"
    t.date     "birthday"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "diploma_id"
    t.string   "eng_surname"
    t.string   "eng_firstname"
    t.string   "eng_patrynomic"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "person_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
