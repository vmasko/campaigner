# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120425055024) do

  create_table "campaigns", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "ctype"
    t.string   "status"
    t.boolean  "active",      :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", :force => true do |t|
    t.integer  "campaign_id"
    t.string   "name"
    t.string   "role",        :default => "Participant"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plannings", :force => true do |t|
    t.integer  "campaign_id"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "num_sent",                                        :default => 0
    t.decimal  "expected_response", :precision => 8, :scale => 2, :default => 0.0
    t.integer  "expected_revenue"
    t.integer  "budgeted_cost"
    t.integer  "actual_cost"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
