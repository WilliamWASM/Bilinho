class AddStatusToInstitutions < ActiveRecord::Migration[8.1]
  def change
    add_column :institutions, :status, :string
  end
end
