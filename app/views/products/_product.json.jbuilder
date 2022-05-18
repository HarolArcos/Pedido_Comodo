json.extract! product, :id, :nombre, :codigo, :empresa, :precio, :descripcion, :created_at, :updated_at
json.url product_url(product, format: :json)
