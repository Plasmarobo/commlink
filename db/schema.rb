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

ActiveRecord::Schema.define(:version => 20130503151443) do

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

  create_table "players", :force => true do |t|
    t.string   "name"
    t.integer  "skillset_id"
    t.integer  "programset_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "user_id"
  end

  create_table "programsets", :force => true do |t|
    t.integer  "node_id"
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
    t.integer  "player_id"
    t.integer  "npc_id"
    t.integer  "hacking"
    t.integer  "computer"
    t.integer  "electronic_warfare"
    t.integer  "hardware"
    t.integer  "datasearch"
    t.integer  "software"
    t.integer  "cybercombat"
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
