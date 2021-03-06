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

ActiveRecord::Schema.define(version: 20171015071827) do

  create_table "cources", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string "title", default: "", null: false
    t.string "description", default: "", null: false
    t.string "vimeo_id", null: false
    t.string "thumbnail_url", null: false
    t.integer "category_id", null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_cources_on_active"
    t.index ["category_id"], name: "index_cources_on_category_id"
  end

  create_table "lessons", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer "cource_id", null: false
    t.string "title", default: "", null: false
    t.text "description", null: false
    t.string "vimeo_id", null: false
    t.integer "sort", default: 0, null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cource_id", "active"], name: "index_lessons_on_cource_id_and_active"
    t.index ["sort"], name: "index_lessons_on_sort"
  end

end
