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

ActiveRecord::Schema.define(version: 20180227161011) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "country_movies", force: :cascade do |t|
    t.bigint "country_id"
    t.bigint "movie_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_country_movies_on_country_id"
    t.index ["movie_id"], name: "index_country_movies_on_movie_id"
  end

  create_table "genre_movies", force: :cascade do |t|
    t.bigint "genre_id"
    t.bigint "movie_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_genre_movies_on_genre_id"
    t.index ["movie_id"], name: "index_genre_movies_on_movie_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.string "imdb_id"
    t.text "description"
    t.datetime "released_at"
    t.integer "status"
    t.text "actors"
    t.string "years"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "poster"
  end

  create_table "notes", force: :cascade do |t|
    t.integer "bechdel"
    t.text "description"
    t.bigint "movie_id"
    t.text "characters"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_notes_on_movie_id"
  end

  add_foreign_key "country_movies", "countries"
  add_foreign_key "country_movies", "movies"
  add_foreign_key "genre_movies", "genres"
  add_foreign_key "genre_movies", "movies"
  add_foreign_key "notes", "movies"
end
