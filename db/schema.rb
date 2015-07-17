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

ActiveRecord::Schema.define(version: 20150716031528) do

  create_table "components", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.boolean  "is_allowed",  limit: 1
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "available",   limit: 1
  end

  create_table "follows", force: :cascade do |t|
    t.string   "follower_type",   limit: 255
    t.integer  "follower_id",     limit: 4
    t.string   "followable_type", limit: 255
    t.integer  "followable_id",   limit: 4
    t.datetime "created_at"
  end

  add_index "follows", ["followable_id", "followable_type"], name: "fk_followables", using: :btree
  add_index "follows", ["follower_id", "follower_type"], name: "fk_follows", using: :btree

  create_table "gear_types", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "type_value",  limit: 255
  end

  create_table "gears", force: :cascade do |t|
    t.string   "gear_key",         limit: 255
    t.text     "gear_description", limit: 65535
    t.integer  "gear_type_id",     limit: 4
    t.integer  "component_id",     limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.text     "select_data",      limit: 65535
  end

  create_table "invite_letters", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.text     "email_list",    limit: 65535
    t.text     "email_content", limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "likes", force: :cascade do |t|
    t.string   "liker_type",    limit: 255
    t.integer  "liker_id",      limit: 4
    t.string   "likeable_type", limit: 255
    t.integer  "likeable_id",   limit: 4
    t.datetime "created_at"
  end

  add_index "likes", ["likeable_id", "likeable_type"], name: "fk_likeables", using: :btree
  add_index "likes", ["liker_id", "liker_type"], name: "fk_likes", using: :btree

  create_table "memos", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "content",    limit: 65535
    t.date     "expired_at"
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "mentions", force: :cascade do |t|
    t.string   "mentioner_type",   limit: 255
    t.integer  "mentioner_id",     limit: 4
    t.string   "mentionable_type", limit: 255
    t.integer  "mentionable_id",   limit: 4
    t.datetime "created_at"
  end

  add_index "mentions", ["mentionable_id", "mentionable_type"], name: "fk_mentionables", using: :btree
  add_index "mentions", ["mentioner_id", "mentioner_type"], name: "fk_mentions", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "project_name", limit: 255
    t.date     "project_date"
    t.integer  "user_id",      limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "rows", force: :cascade do |t|
    t.integer  "component_id", limit: 4
    t.integer  "user_id",      limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "task_baskets", force: :cascade do |t|
    t.string   "basket_name", limit: 255
    t.text     "description", limit: 65535
    t.boolean  "available",   limit: 1
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "task_catalogs", force: :cascade do |t|
    t.string   "catalog_name",   limit: 255
    t.boolean  "available",      limit: 1
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "task_basket_id", limit: 4
  end

  create_table "task_types", force: :cascade do |t|
    t.string   "type_name",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "task_icon",  limit: 255
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "task_title",       limit: 255
    t.text     "task_requirement", limit: 65535
    t.datetime "expired_at"
    t.integer  "user_id",          limit: 4
    t.integer  "task_catalog_id",  limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "before_task_days", limit: 4
    t.integer  "task_type_id",     limit: 4
  end

  create_table "user_columns", force: :cascade do |t|
    t.string   "column_value", limit: 255
    t.integer  "gear_id",      limit: 4
    t.integer  "row_id",       limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "user_task_catalogs", force: :cascade do |t|
    t.string   "catalog_name", limit: 255
    t.boolean  "available",    limit: 1
    t.integer  "project_id",   limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "internal_id",  limit: 4
  end

  create_table "user_tasks", force: :cascade do |t|
    t.string   "task_title",           limit: 255
    t.integer  "user_task_catalog_id", limit: 4
    t.text     "task_requirement",     limit: 65535
    t.datetime "expired_at"
    t.integer  "user_id",              limit: 4
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.boolean  "done",                 limit: 1
    t.integer  "task_type_id",         limit: 4
    t.boolean  "is_removed",           limit: 1
    t.integer  "before_task_days",     limit: 4
  end

  create_table "user_validates", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.integer  "validate_code", limit: 4
    t.boolean  "is_validated",  limit: 1
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "phone",         limit: 255
    t.string   "password",      limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "username",               limit: 255
    t.integer  "validate_code",          limit: 4
    t.string   "nickname",               limit: 255
    t.string   "password_salt",          limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "work_categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "work_id",    limit: 4
    t.boolean  "is_allowed", limit: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "work_galleries", force: :cascade do |t|
    t.integer  "work_id",            limit: 4
    t.boolean  "is_lucky",           limit: 1
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "photo_file_name",    limit: 255
    t.string   "photo_content_type", limit: 255
    t.integer  "photo_file_size",    limit: 4
    t.datetime "photo_updated_at"
    t.string   "phone",              limit: 255
  end

  create_table "work_tasks", force: :cascade do |t|
    t.string   "task_title",        limit: 255
    t.integer  "work_id",           limit: 4
    t.date     "expired_at"
    t.text     "task_description",  limit: 65535
    t.integer  "user_id",           limit: 4
    t.text     "people_work_for",   limit: 65535
    t.text     "notification_list", limit: 65535
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "work_category_id",  limit: 4
    t.integer  "task_type_id",      limit: 4
    t.integer  "before_task_days",  limit: 4
    t.boolean  "work_done",         limit: 1
  end

  create_table "works", force: :cascade do |t|
    t.string   "work_title",       limit: 255
    t.integer  "user_id",          limit: 4
    t.text     "work_description", limit: 65535
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.date     "target_date"
    t.string   "uuid",             limit: 255
  end

  add_index "works", ["uuid"], name: "index_works_on_uuid", unique: true, using: :btree

end
