class RemoveCodigoToEmpresa < ActiveRecord::Migration[7.0]
  def change
    remove_column :empresa, :codigo
  end
end
