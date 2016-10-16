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

ActiveRecord::Schema.define(version: 20161012163133) do

  create_table "artykuls", force: :cascade do |t|
    t.integer  "strona_id",           limit: 4
    t.string   "name",                limit: 255
    t.integer  "position",            limit: 4
    t.boolean  "visibility",                        default: true
    t.text     "content",             limit: 65535
    t.string   "images_file_name",    limit: 255
    t.string   "images_content_type", limit: 255
    t.integer  "images_file_size",    limit: 4
    t.datetime "images_updated_at"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "position",   limit: 4
    t.boolean  "visibility",             default: true
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "galeries", force: :cascade do |t|
    t.string   "name",                  limit: 255
    t.integer  "position",              limit: 4
    t.boolean  "visibility",                          default: true
    t.text     "content",               limit: 65535
    t.string   "pictures_file_name",    limit: 255
    t.string   "pictures_content_type", limit: 255
    t.integer  "pictures_file_size",    limit: 4
    t.datetime "pictures_updated_at"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  create_table "pictures", force: :cascade do |t|
    t.integer  "galerie_id",           limit: 4
    t.string   "name",                 limit: 255
    t.integer  "position",             limit: 4
    t.boolean  "visibility",                       default: true
    t.string   "description",          limit: 255
    t.string   "picture_file_name",    limit: 255
    t.string   "picture_content_type", limit: 255
    t.integer  "picture_file_size",    limit: 4
    t.datetime "picture_updated_at"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  create_table "stronas", force: :cascade do |t|
    t.integer  "category_id", limit: 4
    t.string   "name",        limit: 255
    t.integer  "position",    limit: 4
    t.boolean  "visibility",              default: true
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "stronas", ["category_id"], name: "index_stronas_on_category_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 20
    t.string   "surname",         limit: 20
    t.string   "user",            limit: 20
    t.string   "email",           limit: 50,  default: "", null: false
    t.string   "tel",             limit: 15,  default: "", null: false
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "users", ["user"], name: "index_users_on_user", using: :btree

end
