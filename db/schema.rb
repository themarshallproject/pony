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

ActiveRecord::Schema.define(version: 20160712214706) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "emails", force: :cascade do |t|
    t.integer  "template_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "token"
    t.boolean  "is_archived"
  end

  add_index "emails", ["is_archived"], name: "index_emails_on_is_archived", using: :btree
  add_index "emails", ["template_id"], name: "index_emails_on_template_id", using: :btree
  add_index "emails", ["token"], name: "index_emails_on_token", using: :btree

  create_table "templates", force: :cascade do |t|
    t.string   "title"
    t.text     "header"
    t.text     "footer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
