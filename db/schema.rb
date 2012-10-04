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

ActiveRecord::Schema.define(:version => 20121004171414) do

  create_table "galleries", :force => true do |t|
    t.string   "section"
    t.string   "gal_type"
    t.string   "label"
    t.string   "title"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "description"
    t.string   "icon"
  end

  create_table "gallery_translations", :force => true do |t|
    t.integer  "gallery_id"
    t.string   "locale"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "gallery_translations", ["gallery_id"], :name => "index_gallery_translations_on_gallery_id"
  add_index "gallery_translations", ["locale"], :name => "index_gallery_translations_on_locale"

  create_table "page_translations", :force => true do |t|
    t.integer  "page_id"
    t.string   "locale"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "page_translations", ["locale"], :name => "index_page_translations_on_locale"
  add_index "page_translations", ["page_id"], :name => "index_page_translations_on_page_id"

  create_table "pages", :force => true do |t|
    t.string   "section"
    t.string   "label"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "photo"
    t.datetime "rev_date"
  end

  create_table "photo_translations", :force => true do |t|
    t.integer  "photo_id"
    t.string   "locale"
    t.string   "p_title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "photo_translations", ["locale"], :name => "index_photo_translations_on_locale"
  add_index "photo_translations", ["photo_id"], :name => "index_photo_translations_on_photo_id"

  create_table "photos", :force => true do |t|
    t.integer  "gallery_id"
    t.string   "photo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "p_title"
    t.integer  "position"
  end

  create_table "vid_translations", :force => true do |t|
    t.integer  "vid_id"
    t.string   "locale"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "vid_translations", ["locale"], :name => "index_vid_translations_on_locale"
  add_index "vid_translations", ["vid_id"], :name => "index_vid_translations_on_vid_id"

  create_table "vids", :force => true do |t|
    t.string   "section"
    t.string   "title"
    t.text     "description"
    t.string   "link_to_vid"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
