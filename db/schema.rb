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

ActiveRecord::Schema.define(version: 20160329180824) do

  create_table "authors", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "biography",  limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "book_types", force: :cascade do |t|
    t.string   "category",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "book_types", ["category"], name: "index_book_types_on_category", unique: true, using: :btree

  create_table "books", id: false, force: :cascade do |t|
    t.string   "isbn",        limit: 255
    t.string   "title",       limit: 255
    t.string   "category",    limit: 255
    t.string   "publisher",   limit: 255
    t.date     "copyright"
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "author_id",   limit: 4
  end

  add_index "books", ["author_id"], name: "fk_rails_53d51ce16a", using: :btree
  add_index "books", ["isbn"], name: "index_books_on_isbn", unique: true, using: :btree

  create_table "carts", force: :cascade do |t|
    t.string   "book_isbn",     limit: 255
    t.string   "user_username", limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string   "user_username", limit: 255
    t.string   "name",          limit: 255
    t.string   "attachment",    limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "profiles", id: false, force: :cascade do |t|
    t.string   "user_username", limit: 255
    t.string   "fname",         limit: 255
    t.string   "lname",         limit: 255
    t.string   "gender",        limit: 255
    t.string   "email",         limit: 255
    t.string   "address",       limit: 255
    t.date     "birthdate"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "profiles", ["email"], name: "index_profiles_on_email", unique: true, using: :btree
  add_index "profiles", ["user_username"], name: "fk_rails_31b749ed17", using: :btree

  create_table "users", primary_key: "username", force: :cascade do |t|
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "password_digest", limit: 255
    t.integer  "role",            limit: 4,   default: 1
  end

  add_foreign_key "books", "authors", on_delete: :cascade
  add_foreign_key "profiles", "users", column: "user_username", primary_key: "username", on_update: :cascade, on_delete: :cascade
end
