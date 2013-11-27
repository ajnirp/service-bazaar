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

ActiveRecord::Schema.define(version: 20131127081555) do

  create_table "appointments", force: true do |t|
    t.float    "price"
    t.boolean  "isConfirmed"
    t.date     "date"
    t.integer  "user_id"
    t.integer  "listing_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.time     "timeslot"
  end

  add_index "appointments", ["listing_id"], name: "index_appointments_on_listing_id", using: :btree
  add_index "appointments", ["user_id"], name: "index_appointments_on_user_id", using: :btree

  create_table "categories", force: true do |t|
    t.string "title"
    t.text   "description"
  end

  create_table "conversations", force: true do |t|
    t.string   "subject",    default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "feedbackfors", id: false, force: true do |t|
    t.integer "feedbackID",            default: 0,  null: false
    t.string  "buyerName",  limit: 30, default: "", null: false
    t.integer "serviceID"
  end

  create_table "feedbacks", force: true do |t|
    t.float "rating"
    t.text  "review"
  end

  create_table "listings", force: true do |t|
    t.time    "startingTime"
    t.time    "endingTime"
    t.float   "minPrice"
    t.float   "maxPrice"
    t.date    "startDate"
    t.date    "endDate"
    t.float   "latitude"
    t.float   "longitude"
    t.text    "description"
    t.string  "availability"
    t.integer "service_id"
    t.float   "distance"
  end

  add_index "listings", ["service_id"], name: "index_listings_on_service_id", using: :btree

  create_table "notifications", force: true do |t|
    t.string   "type"
    t.text     "body"
    t.string   "subject",              default: ""
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "conversation_id"
    t.boolean  "draft",                default: false
    t.datetime "updated_at",                           null: false
    t.datetime "created_at",                           null: false
    t.integer  "notified_object_id"
    t.string   "notified_object_type"
    t.string   "notification_code"
    t.string   "attachment"
    t.boolean  "global",               default: false
    t.datetime "expires"
  end

  add_index "notifications", ["conversation_id"], name: "index_notifications_on_conversation_id", using: :btree

  create_table "offers", id: false, force: true do |t|
    t.string  "vendorName", limit: 30, default: "", null: false
    t.integer "serviceID",             default: 0,  null: false
  end

  create_table "receipts", force: true do |t|
    t.integer  "receiver_id"
    t.string   "receiver_type"
    t.integer  "notification_id",                            null: false
    t.boolean  "is_read",                    default: false
    t.boolean  "trashed",                    default: false
    t.boolean  "deleted",                    default: false
    t.string   "mailbox_type",    limit: 25
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "receipts", ["notification_id"], name: "index_receipts_on_notification_id", using: :btree

  create_table "services", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
  end

  add_index "services", ["category_id"], name: "index_services_on_category_id", using: :btree
  add_index "services", ["user_id"], name: "index_services_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username",       null: false
    t.float    "latitude",       null: false
    t.float    "longitude",      null: false
    t.string   "realName"
    t.date     "dateOfBirth"
    t.string   "emailID",        null: false
    t.string   "remember_token"
    t.string   "password",       null: false
    t.float    "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["emailID"], name: "index_users_on_emailID", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "notifications", "conversations", name: "notifications_on_conversation_id"

  add_foreign_key "receipts", "notifications", name: "receipts_on_notification_id"

end
