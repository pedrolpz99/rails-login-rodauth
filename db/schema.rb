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

ActiveRecord::Schema[7.0].define(version: 2023_08_12_001544) do
  create_table "account_jwt_refresh_keys", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.string "key", null: false
    t.datetime "deadline", null: false
    t.index ["account_id"], name: "account_jwt_rk_account_id_idx"
    t.index ["account_id"], name: "index_account_jwt_refresh_keys_on_account_id"
  end

  create_table "account_login_change_keys", charset: "utf8mb3", force: :cascade do |t|
    t.string "key", null: false
    t.string "login", null: false
    t.datetime "deadline", null: false
  end

  create_table "account_password_reset_keys", charset: "utf8mb3", force: :cascade do |t|
    t.string "key", null: false
    t.datetime "deadline", null: false
    t.datetime "email_last_sent", default: -> { "CURRENT_TIMESTAMP(6)" }, null: false
  end

  create_table "account_remember_keys", charset: "utf8mb3", force: :cascade do |t|
    t.string "key", null: false
    t.datetime "deadline", null: false
  end

  create_table "account_verification_keys", charset: "utf8mb3", force: :cascade do |t|
    t.string "key", null: false
    t.datetime "requested_at", default: -> { "CURRENT_TIMESTAMP(6)" }, null: false
    t.datetime "email_last_sent", default: -> { "CURRENT_TIMESTAMP(6)" }, null: false
  end

  create_table "accounts", charset: "utf8mb3", force: :cascade do |t|
    t.integer "status", default: 1, null: false
    t.string "email", null: false
    t.string "password_hash"
    t.index ["email"], name: "index_accounts_on_email", unique: true
  end

  create_table "articles", charset: "utf8mb3", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "account_id", null: false
    t.index ["account_id"], name: "index_articles_on_account_id"
  end

  create_table "oauth_applications", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "account_id"
    t.string "name", null: false
    t.string "description"
    t.string "homepage_url"
    t.string "redirect_uri", null: false
    t.string "client_id", null: false
    t.string "client_secret", null: false
    t.string "registration_access_token"
    t.string "scopes", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP(6)" }, null: false
    t.string "token_endpoint_auth_method"
    t.string "grant_types"
    t.string "response_types"
    t.string "client_uri"
    t.string "logo_uri"
    t.string "tos_uri"
    t.string "policy_uri"
    t.string "jwks_uri"
    t.string "jwks"
    t.string "contacts"
    t.string "software_id"
    t.string "software_version"
    t.string "sector_identifier_uri"
    t.string "application_type"
    t.string "initiate_login_uri"
    t.string "subject_type"
    t.string "id_token_signed_response_alg"
    t.string "id_token_encrypted_response_alg"
    t.string "id_token_encrypted_response_enc"
    t.string "userinfo_signed_response_alg"
    t.string "userinfo_encrypted_response_alg"
    t.string "userinfo_encrypted_response_enc"
    t.string "request_object_signing_alg"
    t.string "request_object_encryption_alg"
    t.string "request_object_encryption_enc"
    t.string "request_uris"
    t.boolean "require_signed_request_object"
    t.boolean "require_pushed_authorization_requests", default: false, null: false
    t.string "tls_client_auth_subject_dn"
    t.string "tls_client_auth_san_dns"
    t.string "tls_client_auth_san_uri"
    t.string "tls_client_auth_san_ip"
    t.string "tls_client_auth_san_email"
    t.boolean "tls_client_certificate_bound_access_tokens", default: false
    t.string "post_logout_redirect_uris", null: false
    t.index ["account_id"], name: "fk_rails_211c1cecac"
    t.index ["client_id"], name: "index_oauth_applications_on_client_id", unique: true
    t.index ["client_secret"], name: "index_oauth_applications_on_client_secret", unique: true
  end

  create_table "oauth_grants", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "account_id"
    t.bigint "oauth_application_id"
    t.string "type"
    t.string "code"
    t.string "token"
    t.string "refresh_token"
    t.datetime "expires_in", null: false
    t.string "redirect_uri"
    t.datetime "revoked_at"
    t.string "scopes", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP(6)" }, null: false
    t.string "access_type", default: "offline", null: false
    t.string "code_challenge"
    t.string "code_challenge_method"
    t.string "user_code"
    t.datetime "last_polled_at"
    t.string "certificate_thumbprint"
    t.string "resource"
    t.string "nonce"
    t.string "acr"
    t.string "claims_locales"
    t.string "claims"
    t.index ["account_id"], name: "fk_rails_3e095b0b7e"
    t.index ["oauth_application_id", "code"], name: "index_oauth_grants_on_oauth_application_id_and_code", unique: true
    t.index ["refresh_token"], name: "index_oauth_grants_on_refresh_token", unique: true
    t.index ["token"], name: "index_oauth_grants_on_token", unique: true
    t.index ["user_code"], name: "index_oauth_grants_on_user_code", unique: true
  end

  create_table "oauth_pushed_requests", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "oauth_application_id"
    t.string "code", null: false
    t.string "params", null: false
    t.datetime "expires_in", null: false
    t.index ["code"], name: "index_oauth_pushed_requests_on_code", unique: true
    t.index ["oauth_application_id", "code"], name: "index_oauth_pushed_requests_on_oauth_application_id_and_code", unique: true
  end

  create_table "profiles", charset: "utf8mb3", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "account_jwt_refresh_keys", "accounts"
  add_foreign_key "account_login_change_keys", "accounts", column: "id"
  add_foreign_key "account_password_reset_keys", "accounts", column: "id"
  add_foreign_key "account_remember_keys", "accounts", column: "id"
  add_foreign_key "account_verification_keys", "accounts", column: "id"
  add_foreign_key "articles", "accounts"
  add_foreign_key "oauth_applications", "accounts"
  add_foreign_key "oauth_grants", "accounts"
  add_foreign_key "oauth_grants", "oauth_applications"
  add_foreign_key "oauth_pushed_requests", "oauth_applications"
end
