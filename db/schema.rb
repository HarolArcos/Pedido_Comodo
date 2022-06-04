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

ActiveRecord::Schema[7.0].define(version: 2022_06_03_214965) do
  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "catalogos", force: :cascade do |t|
    t.string "nombre"
    t.string "codigo"
    t.string "empresa"
    t.string "precio"
    t.text "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "nombre"
    t.string "nit"
    t.string "telefono"
    t.string "mail"
    t.string "direccion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "detalleps", force: :cascade do |t|
    t.integer "cantidad"
    t.integer "catalogo_id", null: false
    t.integer "rpedido_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["catalogo_id"], name: "index_detalleps_on_catalogo_id"
    t.index ["rpedido_id"], name: "index_detalleps_on_rpedido_id"
  end

  create_table "ordens", force: :cascade do |t|
    t.string "nombre"
    t.integer "precio"
    t.integer "cantidad"
    t.integer "total"
    t.string "punto_venta"
    t.string "responsable"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rpedidos", force: :cascade do |t|
    t.string "tiendita"
    t.string "responsable"
    t.string "id_producto"
    t.string "cantidad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rventa", force: :cascade do |t|
    t.string "Nombre"
    t.string "Responsable"
    t.integer "Telefono"
    t.string "Mail"
    t.string "Direccion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "perfil"
  end

  create_table "supervisors", force: :cascade do |t|
    t.string "Nombre"
    t.string "Apellido_Paterno"
    t.string "Apellido_Materno"
    t.string "Teléfono"
    t.string "Mail"
    t.string "Dirección"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "perfil"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "Mail"
    t.string "Codigo"
    t.string "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vendedors", force: :cascade do |t|
    t.string "Nombre"
    t.string "Apellido_Paterno"
    t.string "Apellido_Materno"
    t.integer "Telefono"
    t.string "Mail"
    t.string "Direccion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "perfil"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "detalleps", "catalogos"
  add_foreign_key "detalleps", "rpedidos"
end
