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
    t.string "westparkWkshtCollected"
    t.string "site2Collection"
    t.string "neWkshtCollected"
    t.string "site3Collection"
    t.string "seWkshtCollected"
    t.string "site4Collection"
    t.string "nwWkshtCollected"
    t.string "site5Collection"
    t.string "swWkshtCollected"
    t.datetime "nextDeadline"
    t.string "tasks"
    t.string "status"
    t.integer "Wksht"
    t.string "FundedOrUnfundedCDBGEligible"
    t.string "member1"
    t.string "member2"
    t.string "member3"
    t.string "Submit"
    t.string "perform"
    t.integer "lead1"
    t.integer "lead2"
    t.integer "lead3"
    t.string "monitoring1"
    t.string "auditorLink"
    t.string "taskResourceLink"
    t.string "site6SommermeyerNhd"
    t.string "site6SommerWkshtCollected"
    t.string "site7CentralNhd"
    t.string "site7CentralWkshtCollected"
    t.string "Site8KirkpatrickNhd"
    t.string "site8KirkpatrickWkshtCollected"
    t.string "Site9SunbeamNhd"
    t.string "Site9SunbeamNhdWkshtCollected"
    t.string "Site10SwFwyNhd"
    t.string "site10SwFwyNhdWkshtCollected"
    t.string "Site11NMainNhd"
    t.string "site11NMainWkshtCollected"
    t.string "site12HolmesRoadLandfill"
    t.string "site12HolmesRoadLandfillRelatedDocs"
    t.integer "site1WestparkOverdue"
    t.integer "site2NeOverdue"
    t.integer "site3SeOverdue"
    t.integer "site4NwOverdue"
    t.integer "site5SwOverdue"
    t.integer "site6SommmermeyerOverdue"
    t.integer "site7CentralOverdue"
    t.integer "site8KirkpatrickOverdue"
    t.integer "site9SunbeamOverdue"
    t.integer "site10SwFwyOverdue"
    t.integer "site11NMainOverdue"
    t.integer "site12HolmesOverdue"
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
