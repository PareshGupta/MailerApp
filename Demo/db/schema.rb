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

ActiveRecord::Schema.define(version: 20141008072922) do

  create_table "attachments", force: true do |t|
    t.string   "filename"
    t.text     "content"
    t.integer  "e_mail_id"
    t.string   "e_mail_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
  end

  create_table "contacts", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.integer  "phone_number"
    t.text     "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "mailbox_one_id"
    t.integer  "mailbox_two_id"
  end

  create_table "e_mails", force: true do |t|
    t.integer  "sender_mailbox_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "subject"
    t.string   "content"
    t.boolean  "spam",              default: false
  end

  create_table "e_mails_mailboxes", force: true do |t|
    t.integer "e_mail_id"
    t.integer "receiver_mailbox_id"
  end

  create_table "mailboxes", force: true do |t|
    t.string   "email"
    t.string   "firstname"
    t.string   "lastname"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "score",      default: 0
  end

  create_table "users", force: true do |t|
    t.string  "name"
    t.integer "senior_id_id"
  end

end
