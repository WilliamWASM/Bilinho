class CreateFaturas < ActiveRecord::Migration[8.1]
  def change
    create_table :faturas do |t|
      t.decimal :valor_fatura
      t.date :vencimento
      t.text :status
      t.references :matricula, null: false, foreign_key: true

      t.timestamps
    end
  end
end
