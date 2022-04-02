json.extract! vendedor, :id, :Nombre, :Apellido_Paterno, :Apellido_Materno, :Telefono, :Mail, :Direccion, :created_at, :updated_at
json.url vendedor_url(vendedor, format: :json)
