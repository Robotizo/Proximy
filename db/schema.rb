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

ActiveRecord::Schema.define(version: 20200515004130) do

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conversations", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "event_comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "event_post_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "event_notifs", force: :cascade do |t|
    t.boolean  "is_checked", default: false
    t.integer  "event_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "user_id"
  end

  create_table "event_posts", force: :cascade do |t|
    t.text     "content"
    t.string   "image"
    t.integer  "event_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "image"
    t.integer  "group_id"
    t.date     "event_date"
    t.time     "event_time"
    t.date     "event_end_date"
    t.time     "event_end_time"
    t.string   "address"
    t.decimal  "latitude"
    t.decimal  "longitude"
  end

  create_table "events_relationships", force: :cascade do |t|
    t.integer  "followerE_id"
    t.integer  "followedE_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["followedE_id"], name: "index_events_relationships_on_followedE_id"
    t.index ["followerE_id", "followedE_id"], name: "index_events_relationships_on_followerE_id_and_followedE_id", unique: true
    t.index ["followerE_id"], name: "index_events_relationships_on_followerE_id"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "friendships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "status"
  end

  create_table "group_comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "group_post_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "group_posts", force: :cascade do |t|
    t.text     "content"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "group_id"
    t.integer  "user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.string   "image"
    t.string   "cover_image"
  end

  create_table "groups_relationships", force: :cascade do |t|
    t.integer  "followerG_id"
    t.integer  "followedG_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["followedG_id"], name: "index_groups_relationships_on_followedG_id"
    t.index ["followerG_id", "followedG_id"], name: "index_groups_relationships_on_followerG_id_and_followedG_id", unique: true
    t.index ["followerG_id"], name: "index_groups_relationships_on_followerG_id"
  end

  create_table "interests", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image"
    t.integer  "user_id"
    t.string   "category"
  end

  create_table "interests_relationships", force: :cascade do |t|
    t.integer  "followerI_id"
    t.integer  "followedI_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["followedI_id"], name: "index_interests_relationships_on_followedI_id"
    t.index ["followerI_id", "followedI_id"], name: "index_interests_relationships_on_followerI_id_and_followedI_id", unique: true
    t.index ["followerI_id"], name: "index_interests_relationships_on_followerI_id"
  end

  create_table "interests_relationships_to_events", force: :cascade do |t|
    t.integer  "frE_id"
    t.integer  "fdE_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fdE_id"], name: "index_interests_relationships_to_events_on_fdE_id"
    t.index ["frE_id", "fdE_id"], name: "index_interests_relationships_to_events_on_frE_id_and_fdE_id", unique: true
    t.index ["frE_id"], name: "index_interests_relationships_to_events_on_frE_id"
  end

  create_table "interests_relationships_to_groups", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "frI_id"
    t.integer  "fdI_id"
    t.index ["fdI_id"], name: "index_interests_relationships_to_groups_on_fdI_id"
    t.index ["frI_id", "fdI_id"], name: "index_interests_relationships_to_groups_on_frI_id_and_fdI_id", unique: true
    t.index ["frI_id"], name: "index_interests_relationships_to_groups_on_frI_id"
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.text     "body"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "attachment_data"
  end

  create_table "notification_events", force: :cascade do |t|
    t.integer  "event_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.string   "greet"
  end

  create_table "posts", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.string   "image"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "test_users", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email",                                           null: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "image"
    t.string   "avatar"
    t.text     "bio"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.integer  "sign_in_count"
    t.string   "last_name"
    t.string   "slug"
    t.boolean  "distance_is_checked",             default: true
    t.string   "city"
    t.string   "ip"
    t.boolean  "is_admin",                        default: false
    t.string   "country"
    t.string   "encrypted_password",  limit: 128,                 null: false
    t.string   "confirmation_token",  limit: 128
    t.string   "remember_token",      limit: 128,                 null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "gender"
    t.date     "date_of_birth"
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

end
