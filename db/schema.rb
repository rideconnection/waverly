# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141209222020) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "fuzzystrmatch"

  create_table "client_authorizations", force: true do |t|
    t.string   "prime"
    t.string   "last_name"
    t.string   "first_name"
    t.date     "dob"
    t.string   "case_manager"
    t.string   "case_manager_phone"
    t.string   "branch"
    t.integer  "current_authorized"
    t.date     "current_date_begins"
    t.date     "current_date_ends"
    t.date     "current_enter_date"
    t.string   "current_action"
    t.datetime "read_at"
    t.integer  "reader_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "client_authorizations", ["reader_id"], name: "index_client_authorizations_on_reader_id", using: :btree

  create_table "consumers", force: true do |t|
    t.string   "name"
    t.string   "private_key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "consumers", ["private_key"], name: "index_consumers_on_private_key", using: :btree

  create_table "uploaded_trips", force: true do |t|
    t.integer  "upload_id"
    t.string   "prime_number"
    t.string   "client_last"
    t.string   "client_first"
    t.string   "client_mi"
    t.string   "trip_id"
    t.date     "service_date"
    t.time     "pickup_time"
    t.time     "appt_time"
    t.boolean  "will_call"
    t.string   "pickup_name"
    t.string   "pickup_address"
    t.string   "pickup_city"
    t.string   "pickup_state"
    t.string   "pickup_zip"
    t.string   "dropoff_name"
    t.string   "dropoff_address"
    t.string   "dropoff_city"
    t.string   "dropoff_state"
    t.string   "dropoff_zip"
    t.string   "reason"
    t.string   "status"
    t.string   "mode"
    t.float    "mileage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "uploaded_trips", ["upload_id"], name: "index_uploaded_trips_on_upload_id", using: :btree

  create_table "uploads", force: true do |t|
    t.datetime "uploaded_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "administrator"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
