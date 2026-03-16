class CreateAlunos < ActiveRecord::Migration[8.1]
  def change
    create_table :alunos do |t|
      t.string :name
      t.string :cpf
      t.date :data_nascimento
      t.integer :telefone
      t.string :gender
      t.string :payment_method
      t.string :email

      t.timestamps
    end
  end
end
