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

ActiveRecord::Schema.define(version: 2018_10_24_222804) do

  create_table "adoptions", force: :cascade do |t|
    t.integer "owner_id"
    t.integer "dog_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dog_id"], name: "index_adoptions_on_dog_id"
    t.index ["owner_id"], name: "index_adoptions_on_owner_id"
  end

  create_table "adoptions_comments", force: :cascade do |t|
    t.integer "adoption_id"
    t.integer "comment_id"
    t.index ["adoption_id"], name: "index_adoptions_comments_on_adoption_id"
    t.index ["comment_id"], name: "index_adoptions_comments_on_comment_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "feedback"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dogs", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "breed"
    t.text "traits"
    t.integer "weight"
    t.integer "shelter_id"
    t.boolean "adopted", default: false, null: false
    t.index ["shelter_id"], name: "index_dogs_on_shelter_id"
  end

  create_table "owners", force: :cascade do |t|
    t.string "name"
    t.integer "phone_number"
    t.string "email_address"
    t.string "physical_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_owners_on_user_id"
  end

  create_table "shelters", force: :cascade do |t|
    t.string "name"
    t.string "physical_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "provider"
    t.string "uid"
  end

end
