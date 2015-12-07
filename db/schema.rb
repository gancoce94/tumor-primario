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

ActiveRecord::Schema.define(version: 20151201153918) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "tumors", force: true do |t|
    t.string   "edad"
    t.string   "genero"
    t.string   "tipo_histologico"
    t.string   "grado_tumor"
    t.boolean  "hueso"
    t.boolean  "medula_osea"
    t.boolean  "pulmon"
    t.boolean  "pleura"
    t.boolean  "peritoneum"
    t.boolean  "higado"
    t.boolean  "cerebro"
    t.boolean  "piel"
    t.boolean  "cuello"
    t.boolean  "supraclavicular"
    t.boolean  "axilar"
    t.boolean  "mediastino"
    t.boolean  "abdominal"
    t.string   "tipo_tumor"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "email"
  end

end
