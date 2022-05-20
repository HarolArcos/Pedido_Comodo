json.extract! orden, :id, :nombre, :precio, :cantidad, :total, :punto_venta, :responsable, :created_at, :updated_at
json.url orden_url(orden, format: :json)
