class ChangeDataTypePrecio < ActiveRecord::Migration[7.0]
  def up
    change_column :catalogos, :precio, :float
end

def down
    change_column :catalogos, :precio, :integer
end
end
