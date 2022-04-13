class Vendedor < ApplicationRecord
    has_one_attached:imagen
    mount_uploader :perfil, PerfilUploader
    validates :Nombre, :Apellido_Paterno, :Apellido_Materno, :Telefono, :Mail, :Direccion, presence: {message:"debe estar llenado"}
    validates :Nombre, format: { with: /\A[a-zA-Z]{2,}(?:[\s-]*[a-zA-Z]+)?{2,}(?:[\s-]*[a-zA-Z]{2,})?\z/, message: "solo acepta letras y maximo 3 palabras cada palabra debe tener minimo 2 letras" }
    validates :Apellido_Paterno, :Apellido_Materno, format: { with: /\A[a-zA-Z]{2,}(?:[\s-]*[a-zA-Z]{2,})?\z/, message: "solo acepta letras y maximo 2 palabras cada palabra debe tener minimo 2 letras" }
    validates :Nombre, length: { in: 2..21 , message: "tiene que tener minimo 2 letras y maximo 21"}
    validates :Apellido_Materno, length: { in: 2..21 , message: "Tiene que tener minimo 2 letras y maximo 21"}
    validates :Apellido_Paterno, length: { in: 2..21 , message: "Tiene que tener minimo 2 letras y maximo 21"}
    validates :Telefono, numericality: { only_integer: true , message:"solo acepta Números"}
    validates :Telefono, length: {is: 8 , message: "Tiene que tener 8 numeros"}
    validates :Telefono, numericality: {in: 60000000..79999999 , message: "Tiene que empezar con 6 o 7"}
    validates :Mail, email_format: {with: /\A\w+(\.*)\w*+([@\s]*)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: 'tiene que ser como el siguiente ejemplo, juan@example.com' }
    validates :Direccion, length: { in: 10..40 , message: "tiene que tener minimo 10 letras y maximo 40"}
    #validates :Direccion, url: { allow_nil: true, message: "tiene que ingresar una url" }
    validates :Direccion, format: { with: /https:\/\/goo.gl\/maps/, message: "tiene que ser un link de google maps" }
    validates :Telefono, :Mail, uniqueness: {message:"ya existe usuario"}
    
    validates :imagen, content_type: [:png, :jpg, :jpeg]
    
end
