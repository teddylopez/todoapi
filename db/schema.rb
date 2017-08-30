
ActiveRecord::Schema.define(version: 20170830002905) do

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.integer  "list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "items", ["list_id"], name: "index_items_on_list_id"

  create_table "lists", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.boolean  "private"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "lists", ["user_id"], name: "index_lists_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
