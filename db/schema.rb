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

ActiveRecord::Schema.define(version: 2020_03_12_165428) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

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
    t.string "quad_status"
  end

  create_table "spatial_ref_sys", primary_key: "srid", id: :integer, default: nil, force: :cascade do |t|
    t.string "auth_name", limit: 256
    t.integer "auth_srid"
    t.string "srtext", limit: 2048
    t.string "proj4text", limit: 2048
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
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"

  create_view "geography_columns", sql_definition: <<-SQL
      SELECT current_database() AS f_table_catalog,
      n.nspname AS f_table_schema,
      c.relname AS f_table_name,
      a.attname AS f_geography_column,
      postgis_typmod_dims(a.atttypmod) AS coord_dimension,
      postgis_typmod_srid(a.atttypmod) AS srid,
      postgis_typmod_type(a.atttypmod) AS type
     FROM pg_class c,
      pg_attribute a,
      pg_type t,
      pg_namespace n
    WHERE ((t.typname = 'geography'::name) AND (a.attisdropped = false) AND (a.atttypid = t.oid) AND (a.attrelid = c.oid) AND (c.relnamespace = n.oid) AND (c.relkind = ANY (ARRAY['r'::"char", 'v'::"char", 'm'::"char", 'f'::"char", 'p'::"char"])) AND (NOT pg_is_other_temp_schema(c.relnamespace)) AND has_table_privilege(c.oid, 'SELECT'::text));
  SQL
  create_view "geometry_columns", sql_definition: <<-SQL
      SELECT (current_database())::character varying(256) AS f_table_catalog,
      n.nspname AS f_table_schema,
      c.relname AS f_table_name,
      a.attname AS f_geometry_column,
      COALESCE(postgis_typmod_dims(a.atttypmod), sn.ndims, 2) AS coord_dimension,
      COALESCE(NULLIF(postgis_typmod_srid(a.atttypmod), 0), sr.srid, 0) AS srid,
      (replace(replace(COALESCE(NULLIF(upper(postgis_typmod_type(a.atttypmod)), 'GEOMETRY'::text), st.type, 'GEOMETRY'::text), 'ZM'::text, ''::text), 'Z'::text, ''::text))::character varying(30) AS type
     FROM ((((((pg_class c
       JOIN pg_attribute a ON (((a.attrelid = c.oid) AND (NOT a.attisdropped))))
       JOIN pg_namespace n ON ((c.relnamespace = n.oid)))
       JOIN pg_type t ON ((a.atttypid = t.oid)))
       LEFT JOIN ( SELECT s.connamespace,
              s.conrelid,
              s.conkey,
              replace(split_part(s.consrc, ''''::text, 2), ')'::text, ''::text) AS type
             FROM ( SELECT pg_constraint.connamespace,
                      pg_constraint.conrelid,
                      pg_constraint.conkey,
                      pg_get_constraintdef(pg_constraint.oid) AS consrc
                     FROM pg_constraint) s
            WHERE (s.consrc ~~* '%geometrytype(% = %'::text)) st ON (((st.connamespace = n.oid) AND (st.conrelid = c.oid) AND (a.attnum = ANY (st.conkey)))))
       LEFT JOIN ( SELECT s.connamespace,
              s.conrelid,
              s.conkey,
              (replace(split_part(s.consrc, ' = '::text, 2), ')'::text, ''::text))::integer AS ndims
             FROM ( SELECT pg_constraint.connamespace,
                      pg_constraint.conrelid,
                      pg_constraint.conkey,
                      pg_get_constraintdef(pg_constraint.oid) AS consrc
                     FROM pg_constraint) s
            WHERE (s.consrc ~~* '%ndims(% = %'::text)) sn ON (((sn.connamespace = n.oid) AND (sn.conrelid = c.oid) AND (a.attnum = ANY (sn.conkey)))))
       LEFT JOIN ( SELECT s.connamespace,
              s.conrelid,
              s.conkey,
              (replace(replace(split_part(s.consrc, ' = '::text, 2), ')'::text, ''::text), '('::text, ''::text))::integer AS srid
             FROM ( SELECT pg_constraint.connamespace,
                      pg_constraint.conrelid,
                      pg_constraint.conkey,
                      pg_get_constraintdef(pg_constraint.oid) AS consrc
                     FROM pg_constraint) s
            WHERE (s.consrc ~~* '%srid(% = %'::text)) sr ON (((sr.connamespace = n.oid) AND (sr.conrelid = c.oid) AND (a.attnum = ANY (sr.conkey)))))
    WHERE ((c.relkind = ANY (ARRAY['r'::"char", 'v'::"char", 'm'::"char", 'f'::"char", 'p'::"char"])) AND (NOT (c.relname = 'raster_columns'::name)) AND (t.typname = 'geometry'::name) AND (NOT pg_is_other_temp_schema(c.relnamespace)) AND has_table_privilege(c.oid, 'SELECT'::text));
  SQL
  create_view "raster_columns", sql_definition: <<-SQL
      SELECT current_database() AS r_table_catalog,
      n.nspname AS r_table_schema,
      c.relname AS r_table_name,
      a.attname AS r_raster_column,
      COALESCE(_raster_constraint_info_srid(n.nspname, c.relname, a.attname), ( SELECT st_srid('010100000000000000000000000000000000000000'::geometry) AS st_srid)) AS srid,
      _raster_constraint_info_scale(n.nspname, c.relname, a.attname, 'x'::bpchar) AS scale_x,
      _raster_constraint_info_scale(n.nspname, c.relname, a.attname, 'y'::bpchar) AS scale_y,
      _raster_constraint_info_blocksize(n.nspname, c.relname, a.attname, 'width'::text) AS blocksize_x,
      _raster_constraint_info_blocksize(n.nspname, c.relname, a.attname, 'height'::text) AS blocksize_y,
      COALESCE(_raster_constraint_info_alignment(n.nspname, c.relname, a.attname), false) AS same_alignment,
      COALESCE(_raster_constraint_info_regular_blocking(n.nspname, c.relname, a.attname), false) AS regular_blocking,
      _raster_constraint_info_num_bands(n.nspname, c.relname, a.attname) AS num_bands,
      _raster_constraint_info_pixel_types(n.nspname, c.relname, a.attname) AS pixel_types,
      _raster_constraint_info_nodata_values(n.nspname, c.relname, a.attname) AS nodata_values,
      _raster_constraint_info_out_db(n.nspname, c.relname, a.attname) AS out_db,
      _raster_constraint_info_extent(n.nspname, c.relname, a.attname) AS extent,
      COALESCE(_raster_constraint_info_index(n.nspname, c.relname, a.attname), false) AS spatial_index
     FROM pg_class c,
      pg_attribute a,
      pg_type t,
      pg_namespace n
    WHERE ((t.typname = 'raster'::name) AND (a.attisdropped = false) AND (a.atttypid = t.oid) AND (a.attrelid = c.oid) AND (c.relnamespace = n.oid) AND (c.relkind = ANY (ARRAY['r'::"char", 'v'::"char", 'm'::"char", 'f'::"char", 'p'::"char"])) AND (NOT pg_is_other_temp_schema(c.relnamespace)) AND has_table_privilege(c.oid, 'SELECT'::text));
  SQL
  create_view "raster_overviews", sql_definition: <<-SQL
      SELECT current_database() AS o_table_catalog,
      n.nspname AS o_table_schema,
      c.relname AS o_table_name,
      a.attname AS o_raster_column,
      current_database() AS r_table_catalog,
      (split_part(split_part(s.consrc, '''::name'::text, 1), ''''::text, 2))::name AS r_table_schema,
      (split_part(split_part(s.consrc, '''::name'::text, 2), ''''::text, 2))::name AS r_table_name,
      (split_part(split_part(s.consrc, '''::name'::text, 3), ''''::text, 2))::name AS r_raster_column,
      (btrim(split_part(s.consrc, ','::text, 2)))::integer AS overview_factor
     FROM pg_class c,
      pg_attribute a,
      pg_type t,
      pg_namespace n,
      ( SELECT pg_constraint.connamespace,
              pg_constraint.conrelid,
              pg_constraint.conkey,
              pg_get_constraintdef(pg_constraint.oid) AS consrc
             FROM pg_constraint) s
    WHERE ((t.typname = 'raster'::name) AND (a.attisdropped = false) AND (a.atttypid = t.oid) AND (a.attrelid = c.oid) AND (c.relnamespace = n.oid) AND ((c.relkind)::text = ANY ((ARRAY['r'::character(1), 'v'::character(1), 'm'::character(1), 'f'::character(1)])::text[])) AND (s.connamespace = n.oid) AND (s.conrelid = c.oid) AND (s.consrc ~~ '%_overview_constraint(%'::text) AND (NOT pg_is_other_temp_schema(c.relnamespace)) AND has_table_privilege(c.oid, 'SELECT'::text));
  SQL
end
