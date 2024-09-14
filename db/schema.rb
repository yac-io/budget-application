# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_09_14_051333) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "name", null: false
    t.string "currency", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "user_id"
    t.string "account_type", default: "cash", null: false
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "investments", force: :cascade do |t|
    t.string "name", null: false
    t.string "isin", null: false
    t.integer "quantity", null: false
    t.decimal "settlement_amount", precision: 8, scale: 2, null: false
    t.string "settlement_currency", null: false
    t.date "date", null: false
    t.bigint "user_id", null: false
    t.bigint "account_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["account_id"], name: "index_investments_on_account_id"
    t.index ["user_id"], name: "index_investments_on_user_id"
  end

  create_table "payment_means", force: :cascade do |t|
    t.string "name", null: false
    t.string "currency", null: false
    t.bigint "account_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "user_id"
    t.index ["account_id"], name: "index_payment_means_on_account_id"
    t.index ["user_id"], name: "index_payment_means_on_user_id"
  end

  create_table "recurring_transactions", force: :cascade do |t|
    t.string "recurring_rule"
    t.bigint "account_id"
    t.bigint "payment_mean_id"
    t.bigint "category_id"
    t.string "name"
    t.string "settlement_currency"
    t.decimal "settlement_amount", precision: 8, scale: 2
    t.bigint "user_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.date "last_run_date"
    t.boolean "active", default: true
    t.index ["account_id"], name: "index_recurring_transactions_on_account_id"
    t.index ["category_id"], name: "index_recurring_transactions_on_category_id"
    t.index ["payment_mean_id"], name: "index_recurring_transactions_on_payment_mean_id"
    t.index ["user_id"], name: "index_recurring_transactions_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "account_id"
    t.bigint "payment_mean_id"
    t.bigint "category_id"
    t.string "name"
    t.string "currency"
    t.decimal "amount", precision: 8, scale: 2
    t.string "settlement_currency"
    t.decimal "settlement_amount", precision: 8, scale: 2
    t.date "date"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "user_id"
    t.boolean "checked", default: false
    t.integer "transaction_type"
    t.index ["account_id", "date"], name: "by_account_date_idx"
    t.index ["account_id"], name: "index_transactions_on_account_id"
    t.index ["category_id"], name: "index_transactions_on_category_id"
    t.index ["payment_mean_id", "date"], name: "by_payment_mean_date_idx"
    t.index ["payment_mean_id"], name: "index_transactions_on_payment_mean_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at", precision: nil
    t.datetime "last_sign_in_at", precision: nil
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "categories", "users"
  add_foreign_key "investments", "accounts"
  add_foreign_key "investments", "users"
  add_foreign_key "payment_means", "accounts"
  add_foreign_key "payment_means", "users"
  add_foreign_key "recurring_transactions", "accounts"
  add_foreign_key "recurring_transactions", "categories"
  add_foreign_key "recurring_transactions", "payment_means"
  add_foreign_key "recurring_transactions", "users"
  add_foreign_key "transactions", "accounts"
  add_foreign_key "transactions", "categories"
  add_foreign_key "transactions", "payment_means"
  add_foreign_key "transactions", "users"
end
