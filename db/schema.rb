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

ActiveRecord::Schema.define(version: 20170407131849) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adresses", force: :cascade do |t|
    t.string   "rue"
    t.string   "ville"
    t.string   "pays"
    t.string   "codePostal"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "point_service_id"
    t.index ["point_service_id"], name: "index_adresses_on_point_service_id", using: :btree
  end

  create_table "departements", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "educations", force: :cascade do |t|
    t.string   "type_education"
    t.string   "name"
    t.date     "date_completed"
    t.integer  "employe_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["employe_id"], name: "index_educations_on_employe_id", using: :btree
  end

  create_table "employes", force: :cascade do |t|
    t.string   "motDePasse"
    t.date     "dateEmbauche"
    t.boolean  "dejaEmbaucher"
    t.boolean  "estDisponible"
    t.string   "nom"
    t.string   "prenom"
    t.string   "courriel"
    t.string   "role"
    t.integer  "organisme_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "telephone_travail"
    t.string   "telephone_home"
    t.string   "telephone_cellulaire"
  end

  create_table "locals", force: :cascade do |t|
    t.string   "nom"
    t.integer  "nombrePlaces"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "point_service_id"
    t.index ["point_service_id"], name: "index_locals_on_point_service_id", using: :btree
  end

  create_table "locals_services", id: false, force: :cascade do |t|
    t.integer "local_id"
    t.integer "service_id"
    t.index ["local_id"], name: "index_locals_services_on_local_id", using: :btree
    t.index ["service_id"], name: "index_locals_services_on_service_id", using: :btree
  end

  create_table "organisme_departements", force: :cascade do |t|
    t.integer  "organisme_id"
    t.integer  "departement_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["departement_id"], name: "index_organisme_departements_on_departement_id", using: :btree
    t.index ["organisme_id"], name: "index_organisme_departements_on_organisme_id", using: :btree
  end

  create_table "organismes", force: :cascade do |t|
    t.string "name"
    t.string "mail"
    t.string "fax"
    t.string "telephone"
    t.string "adresse"
  end

  create_table "point_service_departements", force: :cascade do |t|
    t.integer  "point_service_id"
    t.integer  "departement_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["departement_id"], name: "index_point_service_departements_on_departement_id", using: :btree
    t.index ["point_service_id"], name: "index_point_service_departements_on_point_service_id", using: :btree
  end

  create_table "point_services", force: :cascade do |t|
    t.string   "nom"
    t.string   "courriel"
    t.string   "fax"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "organisme_id"
    t.integer  "adresse_id"
    t.string   "telephone"
  end

  create_table "referents", force: :cascade do |t|
    t.string   "nom"
    t.string   "prenom"
    t.string   "fax"
    t.string   "courriel"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "title"
    t.string   "departement"
    t.string   "preferenceContact"
    t.integer  "organisme_id"
    t.string   "refid"
    t.boolean  "active"
  end

  create_table "services", force: :cascade do |t|
    t.string   "nom"
    t.string   "description"
    t.float    "tarification"
    t.boolean  "estSubventionner"
    t.float    "tarificationCISSS"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "telephones", force: :cascade do |t|
    t.string   "number"
    t.string   "numberType"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "referent_id"
    t.index ["referent_id"], name: "index_telephones_on_referent_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "superadmin_role",        default: false
    t.boolean  "supervisor_role",        default: false
    t.boolean  "user_role",              default: true
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "educations", "employes"
  add_foreign_key "telephones", "referents"
end
