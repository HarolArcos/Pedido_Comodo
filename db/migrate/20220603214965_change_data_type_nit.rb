class ChangeDataTypeNit < ActiveRecord::Migration[7.0]
  def up
    change_column :companies, :nit, :string
    change_column :companies, :telefono, :string
    change_column :catalogos, :codigo, :string
    change_column :catalogos, :precio, :string
    change_column :supervisors, :Teléfono, :string
    change_column :rpedidos, :cantidad, :string

  end

def down
  change_column :companies, :nit, :integer
  change_column :companies, :telefono, :integer
  change_column :catalogos, :codigo, :integer
  change_column :catalogos, :precio, :float
  change_column :supervisors, :Teléfono, :integer
  change_column :rpedidos, :cantidad, :integer
end
end
