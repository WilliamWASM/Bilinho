class AddStatusToMatriculas < ActiveRecord::Migration[8.1]
  def change
    add_column :matriculas, :status, :string
  end
end
