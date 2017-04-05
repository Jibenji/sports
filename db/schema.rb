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

ActiveRecord::Schema.define(version: 20170405101456) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.integer  "participants"
    t.integer  "training_id"
    t.integer  "profile_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["profile_id"], name: "index_bookings_on_profile_id", using: :btree
    t.index ["training_id"], name: "index_bookings_on_training_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.string   "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["receiver_id"], name: "index_messages_on_receiver_id", using: :btree
    t.index ["sender_id"], name: "index_messages_on_sender_id", using: :btree
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.boolean  "admin",          default: false
    t.integer  "phone_number"
    t.string   "address"
    t.string   "city"
    t.string   "zip_code"
    t.string   "country"
    t.date     "birth_date"
    t.integer  "user_id"
    t.integer  "trainer_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "avatar_picture"
    t.index ["trainer_id"], name: "index_profiles_on_trainer_id", using: :btree
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "requests", force: :cascade do |t|
    t.string   "certificates"
    t.string   "education"
    t.string   "description"
    t.string   "bio"
    t.integer  "profile_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "banner_picture"
    t.index ["profile_id"], name: "index_requests_on_profile_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "content"
    t.integer  "rating"
    t.integer  "booking_id"
    t.integer  "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_reviews_on_booking_id", using: :btree
    t.index ["profile_id"], name: "index_reviews_on_profile_id", using: :btree
  end

  create_table "sports", force: :cascade do |t|
    t.string   "name"
    t.string   "tagline"
    t.string   "description"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "banner_sport_picture"
  end

  create_table "trainers", force: :cascade do |t|
    t.string   "certificates"
    t.string   "education"
    t.string   "description"
    t.string   "bio"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "banner_picture"
  end

  create_table "trainings", force: :cascade do |t|
    t.string   "title"
    t.date     "date"
    t.time     "time"
    t.integer  "duration"
    t.integer  "price"
    t.integer  "group_capacity"
    t.string   "level"
    t.string   "description"
    t.boolean  "outdoor"
    t.decimal  "longitude"
    t.decimal  "latitude"
    t.string   "country"
    t.string   "zip_code"
    t.string   "city"
    t.string   "address"
    t.integer  "sport_id"
    t.integer  "profile_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["profile_id"], name: "index_trainings_on_profile_id", using: :btree
    t.index ["sport_id"], name: "index_trainings_on_sport_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "token"
    t.datetime "token_expiry"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "bookings", "profiles"
  add_foreign_key "bookings", "trainings"
  add_foreign_key "messages", "profiles", column: "receiver_id"
  add_foreign_key "messages", "profiles", column: "sender_id"
  add_foreign_key "profiles", "trainers"
  add_foreign_key "profiles", "users"
  add_foreign_key "requests", "profiles"
  add_foreign_key "reviews", "bookings"
  add_foreign_key "reviews", "profiles"
  add_foreign_key "trainings", "profiles"
  add_foreign_key "trainings", "sports"
end
