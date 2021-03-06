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

ActiveRecord::Schema.define(version: 2019_09_17_125926) do

  create_table "items", force: :cascade do |t|
    t.text "description"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "merchants", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchase_batches", force: :cascade do |t|
    t.decimal "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchasers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.integer "item_quantity"
    t.integer "item_id"
    t.integer "purchaser_id"
    t.integer "merchant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "purchase_batch_id"
    t.index ["item_id"], name: "index_purchases_on_item_id"
    t.index ["merchant_id"], name: "index_purchases_on_merchant_id"
    t.index ["purchase_batch_id"], name: "index_purchases_on_purchase_batch_id"
    t.index ["purchaser_id"], name: "index_purchases_on_purchaser_id"
  end

end
