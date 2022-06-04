class Change < ActiveRecord::Migration[7.0]
  def up
    change_column :rventa, :Telefono, :string
    change_column :vendedors, :Telefono, :string

   

  end

def down
  change_column :rventa, :Telefono, :integer
  change_column :vendedors, :Telefono, :integer
end
end
