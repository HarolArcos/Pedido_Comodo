class AddMailToEmpresa < ActiveRecord::Migration[7.0]
  def change
    add_column :empresas, :mail, :string
    add_column :empresas, :nit, :integer
  end
end
