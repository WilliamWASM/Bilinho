class AddStatusToAlunos < ActiveRecord::Migration[8.1]
  def change
    add_column :alunos, :status, :string
  end
end
