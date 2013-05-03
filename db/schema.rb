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

ActiveRecord::Schema.define(:version => 20130502232641) do

  create_table "gamesessions", :force => true do |t|
    t.string   "name"
    t.integer  "gm_id"
    t.integer  "group_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.integer  "player_id"
    t.integer  "gamesession_id"
    t.integer  "group_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "nodes", :force => true do |t|
    t.string   "name"
    t.string   "desc"
    t.integer  "gamesession_id"
    t.integer  "player_id"
    t.integer  "programset_id"
    t.integer  "system"
    t.integer  "firewall"
    t.integer  "response"
    t.integer  "signal"
    t.integer  "stealth"
    t.integer  "gm_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "players", :force => true do |t|
    t.string   "name"
    t.integer  "skillset_id"
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "programsets", :force => true do |t|
    t.integer  "node_id"
    t.integer  "player_id"
    t.integer  "analyze"
    t.integer  "browse"
    t.integer  "command"
    t.integer  "edit"
    t.integer  "encrypt"
    t.integer  "reality_filter"
    t.integer  "scan"
    t.integer  "armor"
    t.integer  "attack"
    t.integer  "biofeedback_filter"
    t.integer  "black_hammer"
    t.integer  "blackout"
    t.integer  "data_bomb"
    t.integer  "decrypt"
    t.integer  "defuse"
    t.integer  "eccm"
    t.integer  "exploit"
    t.integer  "medic"
    t.integer  "sniffer"
    t.integer  "spoof"
    t.integer  "stealth"
    t.integer  "track"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "skillsets", :force => true do |t|
    t.integer  "software"
    t.integer  "hardware"
    t.integer  "data_search"
    t.integer  "computer"
    t.integer  "hacking"
    t.integer  "electronic_warfare"
    t.integer  "cybercombat"
    t.integer  "player_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
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

end
