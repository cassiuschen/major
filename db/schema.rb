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

ActiveRecord::Schema.define(version: 20150521122952) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "content"
    t.integer  "rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "articles", ["user_id"], name: "index_articles_on_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "colleges", force: :cascade do |t|
    t.string   "name"
    t.text     "desc"
    t.integer  "university_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "short_name",    null: false
  end

  add_index "colleges", ["university_id"], name: "index_colleges_on_university_id", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "mobile"
    t.string   "wechat"
    t.string   "qq"
    t.string   "skype"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "contacts", ["user_id"], name: "index_contacts_on_user_id", using: :btree

  create_table "feed_backs", force: :cascade do |t|
    t.boolean  "done",       default: false
    t.text     "content"
    t.string   "sender",     default: "system"
    t.string   "contact"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "first_grade_disciplines", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "first_grade_disciplines", ["category_id"], name: "index_first_grade_disciplines_on_category_id", using: :btree

  create_table "invite_tokens", force: :cascade do |t|
    t.string   "token",                  null: false
    t.integer  "limit",      default: 5
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "majors", force: :cascade do |t|
    t.string   "name"
    t.text     "desc"
    t.string   "code"
    t.integer  "college_id"
    t.integer  "second_grade_discipline_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "majors", ["college_id"], name: "index_majors_on_college_id", using: :btree
  add_index "majors", ["second_grade_discipline_id"], name: "index_majors_on_second_grade_discipline_id", using: :btree

  create_table "second_grade_disciplines", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "first_grade_discipline_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "second_grade_disciplines", ["first_grade_discipline_id"], name: "index_second_grade_disciplines_on_first_grade_discipline_id", using: :btree

  create_table "universities", force: :cascade do |t|
    t.string   "name"
    t.string   "logo"
    t.text     "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "short_name", null: false
    t.string   "tag"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "public",                 default: false
    t.integer  "sexal",                  default: 0
    t.integer  "major_id"
    t.integer  "role",                   default: 0
    t.text     "desc"
    t.string   "avatar"
    t.string   "name"
    t.string   "alipay_account"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["major_id"], name: "index_users_on_major_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "articles", "users"
  add_foreign_key "colleges", "universities"
  add_foreign_key "contacts", "users"
  add_foreign_key "first_grade_disciplines", "categories"
  add_foreign_key "majors", "colleges"
  add_foreign_key "majors", "second_grade_disciplines"
  add_foreign_key "second_grade_disciplines", "first_grade_disciplines"
  add_foreign_key "users", "majors"
end
