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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130508225540) do

  create_table "gamesessions", :force => true do |t|
    t.integer  "group_id"
    t.integer  "gm_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "groups", :force => true do |t|
    t.integer  "gamesession_id"
    t.integer  "player_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "node_templates", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "desc"
    t.integer  "programset_id"
    t.integer  "system"
    t.integer  "firewall"
    t.integer  "response"
    t.integer  "pilot"
    t.integer  "signal"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "nodes", :force => true do |t|
    t.integer  "player_id"
    t.string   "name"
    t.text     "desc"
    t.integer  "programset_id"
    t.integer  "system"
    t.integer  "firewall"
    t.integer  "response"
    t.integer  "pilot"
    t.integer  "signal"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "gamesession_id"
  end

  create_table "npcs", :force => true do |t|
    t.string   "name"
    t.text     "desc"
    t.text     "secret"
    t.integer  "node_id"
    t.integer  "gamesession_id"
    t.integer  "gm_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "pals", :force => true do |t|
    t.integer  "user_id"
    t.integer  "pal_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "players", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
    t.integer  "condition"
    t.integer  "stun"
  end

  create_table "programset_templates", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.integer  "analyze",            :default => 1
    t.integer  "browse",             :default => 1
    t.integer  "command",            :default => 0
    t.integer  "edit",               :default => 1
    t.integer  "encrypt",            :default => 0
    t.integer  "reality_filter",     :default => 0
    t.integer  "scan",               :default => 1
    t.integer  "armor",              :default => 0
    t.integer  "attack",             :default => 0
    t.integer  "biofeedback_filter", :default => 0
    t.integer  "black_hammer",       :default => 0
    t.integer  "blackout",           :default => 0
    t.integer  "data_bomb",          :default => 0
    t.integer  "decrypt",            :default => 0
    t.integer  "defuse",             :default => 0
    t.integer  "eccm",               :default => 0
    t.integer  "exploit",            :default => 0
    t.integer  "medic",              :default => 0
    t.integer  "sniffer",            :default => 0
    t.integer  "spoof",              :default => 0
    t.integer  "stealth",            :default => 0
    t.integer  "track",              :default => 0
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "programsets", :force => true do |t|
    t.integer  "node_id"
    t.integer  "analyze",            :default => 1
    t.integer  "browse",             :default => 1
    t.integer  "command",            :default => 0
    t.integer  "edit",               :default => 1
    t.integer  "encrypt",            :default => 0
    t.integer  "reality_filter",     :default => 0
    t.integer  "scan",               :default => 1
    t.integer  "armor",              :default => 0
    t.integer  "attack",             :default => 0
    t.integer  "biofeedback_filter", :default => 0
    t.integer  "black_hammer",       :default => 0
    t.integer  "blackout",           :default => 0
    t.integer  "data_bomb",          :default => 0
    t.integer  "decrypt",            :default => 0
    t.integer  "defuse",             :default => 0
    t.integer  "eccm",               :default => 0
    t.integer  "exploit",            :default => 0
    t.integer  "medic",              :default => 0
    t.integer  "sniffer",            :default => 0
    t.integer  "spoof",              :default => 0
    t.integer  "stealth",            :default => 0
    t.integer  "track",              :default => 0
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "skillsets", :force => true do |t|
    t.integer  "npc_id"
    t.integer  "hacking",            :default => 0
    t.integer  "computer",           :default => 1
    t.integer  "electronic_warfare", :default => 0
    t.integer  "hardware",           :default => 0
    t.integer  "datasearch",         :default => 1
    t.integer  "software",           :default => 1
    t.integer  "cybercombat",        :default => 0
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password"
    t.string   "salt"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
  end

  create_table "visiblenodes", :force => true do |t|
    t.integer  "player_id"
    t.integer  "node_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
