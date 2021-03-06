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

ActiveRecord::Schema.define(version: 20140720013551) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: true do |t|
    t.string   "name",                          null: false
    t.float    "initial_balance", default: 0.0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["name"], name: "index_accounts_on_name", unique: true, using: :btree

  create_table "budgets", force: true do |t|
    t.string   "name",                      null: false
    t.decimal  "amount",      default: 0.0, null: false
    t.date     "start_date",                null: false
    t.date     "end_date",                  null: false
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "expenses", force: true do |t|
    t.string   "description",                            null: false
    t.date     "date",                                   null: false
    t.float    "amount",                                 null: false
    t.integer  "account_id",                             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "payee",       default: "PUT SOME VALID", null: false
  end

  add_index "expenses", ["account_id"], name: "index_expenses_on_account_id", using: :btree

end
