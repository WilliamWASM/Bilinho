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

ActiveRecord::Schema[8.1].define(version: 2026_03_28_153009) do
  create_table "alunos", force: :cascade do |t|
    t.string "cpf"
    t.datetime "created_at", null: false
    t.date "data_nascimento"
    t.string "email"
    t.string "gender"
    t.string "name"
    t.string "payment_method"
    t.string "status"
    t.integer "telefone"
    t.datetime "updated_at", null: false
  end

  create_table "faturas", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "matricula_id", null: false
    t.text "status"
    t.datetime "updated_at", null: false
    t.decimal "valor_fatura"
    t.date "vencimento"
    t.index ["matricula_id"], name: "index_faturas_on_matricula_id"
  end

  create_table "institutions", force: :cascade do |t|
    t.string "cnpj"
    t.datetime "created_at", null: false
    t.string "institution_type"
    t.string "name"
    t.string "status"
    t.datetime "updated_at", null: false
  end

  create_table "matriculas", force: :cascade do |t|
    t.integer "aluno_id", null: false
    t.datetime "created_at", null: false
    t.integer "dia_vencimento"
    t.integer "institution_id", null: false
    t.text "nome_curso"
    t.integer "qtd_faturas"
    t.string "status"
    t.datetime "updated_at", null: false
    t.decimal "valor_total"
    t.index ["aluno_id"], name: "index_matriculas_on_aluno_id"
    t.index ["institution_id"], name: "index_matriculas_on_institution_id"
  end

  add_foreign_key "faturas", "matriculas"
  add_foreign_key "matriculas", "alunos"
  add_foreign_key "matriculas", "institutions"
end
