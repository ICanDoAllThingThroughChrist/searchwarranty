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

ActiveRecord::Schema.define(version: 20200211221950) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.string "site1recycling"
    t.string "westparkwkshtcollected"
    t.string "site2collection"
    t.string "newkshtcollected"
    t.string "site3collection"
    t.string "sewkshtcollected"
    t.string "site4collection"
    t.string "nwwkshtcollected"
    t.string "site5collection"
    t.string "swwkshtcollected"
    t.datetime "nextdeadline"
    t.string "tasks"
    t.string "status"
    t.integer "wksht"
    t.string "fundedorunfundedcdbgeligible"
    t.string "member1"
    t.string "member2"
    t.string "member3"
    t.string "submit"
    t.string "perform"
    t.integer "lead1"
    t.integer "lead2"
    t.integer "lead3"
    t.string "monitoring1"
    t.string "auditorlink"
    t.string "taskresourcelink"
    t.string "site6sommermeyernhd"
    t.string "site6sommerwkshtcollected"
    t.string "site7centralnhd"
    t.string "site7centralwkshtcollected"
    t.string "site8kirkpatricknhd"
    t.string "site8kirkpatrickwkshtcollected"
    t.string "site9sunbeamnhd"
    t.string "site9sunbeamnhdwkshtcollected"
    t.string "site10swfwynhd"
    t.string "site10swfwynhdwkshtcollected"
    t.string "site11nmainnhd"
    t.string "site11nmainwkshtcollected"
    t.string "site12holmesroadlandfill"
    t.string "site12holmesroadlandfillrelateddocs"
    t.integer "site1westparkoverdue"
    t.integer "site2neoverdue"
    t.integer "site3seoverdue"
    t.integer "site4nwoverdue"
    t.integer "site5swoverdue"
    t.integer "site6sommmermeyeroverdue"
    t.integer "site7centraloverdue"
    t.integer "site8kirkpatrickoverdue"
    t.integer "site9sunbeamoverdue"
    t.integer "site10swfwyoverdue"
    t.integer "site11nmainoverdue"
    t.integer "site12holmesoverdue"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
    t.integer "field1"
    t.integer "field2"
    t.string "client"
    t.string "garbage_route"
    t.string "heavy_trash_quad"
    t.string "sr_owner"
    t.string "sr_creator"
    t.integer "resolve_days"
    t.integer "street_num"
    t.string "client_street"
    t.string "city"
    t.string "state"
    t.integer "zip"
    t.string "phone_number"
    t.string "email_address"
    t.string "garbage_day1"
    t.string "garbage_quad"
    t.string "recycle_day1"
    t.string "recycle_route"
    t.integer "resolution_time"
  end

end
