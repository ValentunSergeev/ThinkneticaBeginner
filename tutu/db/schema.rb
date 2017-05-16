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

ActiveRecord::Schema.define(version: 20170516114853) do

  create_table "railway_stations", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "railway_stations_routes", force: :cascade do |t|
    t.integer "route_id"
    t.integer "railway_station_id"
    t.integer "position"
    t.time    "arrival_time",       default: '2000-01-01 13:44:53'
    t.time    "departure_time",     default: '2000-01-01 13:44:53'
    t.index ["railway_station_id"], name: "index_railway_stations_routes_on_railway_station_id"
    t.index ["route_id"], name: "index_railway_stations_routes_on_route_id"
  end

  create_table "routes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.integer  "train_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_id"
    t.integer  "end_station_id"
    t.integer  "start_station_id"
    t.string   "full_name"
    t.index ["end_station_id"], name: "index_tickets_on_end_station_id"
    t.index ["start_station_id"], name: "index_tickets_on_start_station_id"
    t.index ["train_id"], name: "index_tickets_on_train_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "trains", force: :cascade do |t|
    t.string   "number"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "route_id"
    t.integer  "railway_station_id"
    t.boolean  "inverse_wagons_order", default: false
    t.index ["railway_station_id"], name: "index_trains_on_railway_station_id"
    t.index ["route_id"], name: "index_trains_on_route_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wagons", force: :cascade do |t|
    t.integer  "top_seats",         default: 0
    t.integer  "bottom_seats",      default: 0
    t.integer  "train_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "side_top_seats",    default: 0
    t.integer  "side_bottom_seats", default: 0
    t.integer  "sitting_seats",     default: 0
    t.string   "type"
    t.integer  "number"
    t.index ["train_id"], name: "index_wagons_on_train_id"
  end

end
