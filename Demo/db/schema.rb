# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
ActiveRecord::Schema.define(version: 20141008114757) do

  create_table "attachments", force: true do |t|
    t.string   "filename"
    t.text     "content"
    t.integer  "email_id"
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

  create_table "emails", force: true do |t|
    t.integer  "sender_mailbox_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "subject"
    t.string   "content"
    t.boolean  "spam",              default: false
  end

  create_table "emails_mailboxes", force: true do |t|
    t.integer "email_id"
    t.integer "receiver_mailbox_id"
  end

  create_table "logs", force: true do |t|
    t.string   "information"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mailboxes", force: true do |t|
    t.string   "email"
    t.string   "firstname"
    t.string   "lastname"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "score",      default: 0
  end

end
