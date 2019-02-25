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

ActiveRecord::Schema.define(version: 20190225031926) do

  create_table "feedbacks", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "recipient_id"
    t.string "type"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipient_id"], name: "index_feedbacks_on_recipient_id"
    t.index ["sender_id"], name: "index_feedbacks_on_sender_id"
  end

  create_table "group_sessions", force: :cascade do |t|
    t.string "subject"
    t.datetime "schedule"
    t.string "venue"
    t.string "topic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "links", force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_session_id"], name: "index_links_on_group_session_id"
    t.index ["user_id"], name: "index_links_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "lastname"
    t.string "firstname"
    t.string "mi"
    t.string "address"
    t.string "username"
    t.string "password"
    t.string "salt"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "expires"
  end

end
