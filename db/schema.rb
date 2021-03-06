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

ActiveRecord::Schema.define(version: 2020_06_16_163204) do

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
    t.string "overdue_or_not"
  end

  create_table "carts", force: :cascade do |t|
    t.string "sr_number"
    t.string "client"
    t.string "service_location"
    t.string "status"
    t.decimal "client_str_no"
    t.string "client_str_name"
    t.decimal "client_zip_code"
    t.string "phone_number"
    t.string "email_address"
    t.datetime "create_date"
    t.datetime "due_date"
    t.datetime "closed_date"
    t.decimal "overdue"
    t.string "agent_name"
    t.string "super_neighborhood"
    t.decimal "tax_id"
    t.string "service_area"
    t.string "district"
    t.string "key_map"
    t.string "management_district"
    t.string "garbage_route"
    t.string "garbage_day"
    t.string "garbage_quad"
    t.string "recycle_route"
    t.string "recycle_day"
    t.string "recycle_quad"
    t.string "heavy_trash_day"
    t.string "heavy_trash_quad"
    t.string "subject"
    t.string "reason"
    t.string "service_type"
    t.string "queue"
    t.string "sla"
    t.string "container_problem"
    t.string "container_damage"
    t.string "case_note"
    t.string "resolution_comment"
    t.string "channel_type"
    t.string "other_description"
    t.string "title"
    t.decimal "x"
    t.decimal "y"
    t.decimal "latitude"
    t.decimal "longitude"
    t.decimal "tax_id1"
    t.string "unique"
    t.string "cart_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "delivered"
    t.integer "replaced_cart"
    t.integer "serviced"
    t.integer "replace_wheel_lid"
    t.integer "tally"
    t.datetime "sr_create_date"
  end

  create_table "duplicates", force: :cascade do |t|
    t.bigint "case_number"
    t.string "trash_quad"
    t.integer "overdue"
    t.string "expression"
    t.string "sr_type"
  end

  create_table "facilities", force: :cascade do |t|
    t.string "address"
    t.string "location"
    t.string "op_days"
    t.string "op_hrs"
    t.string "poc_name"
    t.string "poc_phone"
    t.string "poc_cell"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gis_swmd_lists", force: :cascade do |t|
    t.integer "OBJECTID"
    t.integer "STREET_NUM"
    t.text "FRACTION"
    t.text "PREFIX"
    t.text "STREET_NAME"
    t.text "SUFFIX"
    t.text "STREET_TYPE"
    t.text "STATE"
    t.text "CITY"
    t.integer "ZIPCODE"
    t.text "GlobalID"
    t.text "synthetic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "created_user"
    t.datetime "created_date"
    t.string "last_edited_user"
    t.datetime "last_edited_date"
    t.string "SEC_NAME"
    t.string "COLLECT_DAY"
    t.string "QUAD"
    t.string "HELP_SECTION"
    t.string "RECY_QUAD"
    t.string "RECY_COLLECT_DAY"
    t.string "RECY_SEC_NAME"
    t.string "HVY_TRSH_SEC_NAME"
    t.string "HVY_TRSH_COLLECT_DAY"
    t.string "HVY_TRSH_QUAD"
    t.integer "LIFT_COUNT"
    t.string "SERV_TYPE"
    t.float "X_COORD"
    t.float "Y_COORD"
    t.string "DESCR"
    t.float "LAT"
    t.float "LONG"
    t.integer "Customer_ID"
  end

  create_table "missed_hvies", force: :cascade do |t|
    t.string "sr_location"
    t.string "trash_quad"
    t.string "case_number"
    t.integer "overdue"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "open_srs", force: :cascade do |t|
    t.string "case_numbe"
    t.string "sr_type"
    t.string "sec_name"
    t.string "quad"
    t.string "day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tally"
    t.string "quad_statu"
    t.string "sr_locatio"
  end

  create_table "residents", force: :cascade do |t|
    t.string "unique"
    t.string "sr_type"
    t.float "case_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tally"
  end

  create_table "spatial_overdue_hvies", force: :cascade do |t|
    t.integer "ID"
    t.text "case_number"
    t.float "longitude"
    t.float "latitude"
    t.string "poly_id"
    t.string "service_da"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spatials", force: :cascade do |t|
    t.integer "spatialjoin_id"
    t.string "case_numbe"
    t.string "quad"
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
    t.string "expression"
    t.integer "ne_overdue"
    t.integer "ne_not_overdue"
    t.integer "ne_sr_total"
    t.integer "nw_overdue"
    t.integer "nw_not_overdue"
    t.integer "nw_sr_total"
    t.integer "se_overdue"
    t.integer "se_not_overdue"
    t.integer "se_sr_total"
    t.integer "sw_overdue"
    t.integer "sw_not_overdue"
    t.integer "sw_sr_total"
    t.string "quad_status"
    t.integer "tally"
    t.string "month_yr"
    t.string "street2"
    t.string "sr_type_2"
    t.string "client_str_no"
    t.string "client_str_name"
    t.string "client_zip_code"
    t.datetime "closed_date"
    t.string "agent_name"
    t.string "super_neighborhood"
    t.string "service_area"
    t.string "garbage_day"
    t.string "subject"
    t.string "reason"
    t.string "type"
    t.string "other_description"
    t.string "resolution_notes"
  end

  create_table "warranty_lists", force: :cascade do |t|
    t.integer "case1"
    t.integer "case2"
    t.date "expiration_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
