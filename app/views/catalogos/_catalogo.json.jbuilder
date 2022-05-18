json.extract! catalogo, :id, :nombre, :codigo, :empresa, :precio, :descripcion, :created_at, :updated_at
json.url catalogo_url(catalogo, format: :json)
