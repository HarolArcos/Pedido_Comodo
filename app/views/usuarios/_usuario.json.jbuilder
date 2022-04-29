json.extract! usuario, :id, :Mail, :Codigo, :tipo, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
