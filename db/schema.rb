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

ActiveRecord::Schema.define(version: 20200107202832) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carts", force: :cascade do |t|
    t.string "cart_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "srs", force: :cascade do |t|
    t.string "case_number"
    t.string "sr_location"
    t.string "county"
    t.string "district"
    t.string "neighborhood"
    t.bigint "tax_id"
    t.string "trash_quad"
    t.string "recycle_quad"
    t.string "trash_day"
    t.string "heavy_trash_day"
    t.string "recycle_day"
    t.string "key_map"
    t.string "management_district"
    t.string "department"
    t.string "division"
    t.string "sr_type"
    t.string "queue"
    t.integer "sla"
    t.string "status"
    t.datetime "sr_create_date"
    t.datetime "due_date"
    t.datetime "date_closed"
    t.integer "overdue"
    t.string "title"
    t.integer "x"
    t.integer "y"
    t.float "latitude"
    t.float "longitude"
    t.string "channel_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
