json.extract! company, :id, :nombre, :nit, :telefono, :mail, :direccion, :created_at, :updated_at
json.url company_url(company, format: :json)
