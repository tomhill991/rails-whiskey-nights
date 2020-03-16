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

ActiveRecord::Schema.define(version: 2020_03_16_100312) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bars", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cocktails", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "menu_id"
    t.index ["menu_id"], name: "index_cocktails_on_menu_id"
  end

  create_table "doses", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "ingredient_id"
    t.bigint "cocktail_id"
    t.index ["cocktail_id"], name: "index_doses_on_cocktail_id"
    t.index ["ingredient_id"], name: "index_doses_on_ingredient_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menus", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "bar_id"
    t.index ["bar_id"], name: "index_menus_on_bar_id"
  end

  add_foreign_key "cocktails", "menus"
  add_foreign_key "doses", "cocktails"
  add_foreign_key "doses", "ingredients"
  add_foreign_key "menus", "bars"
end
