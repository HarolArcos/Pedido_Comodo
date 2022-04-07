class Vendedor < ApplicationRecord
    has_one_attached:imagen
    mount_uploader :perfil, PerfilUploader
    validates :Nombre, :Apellido_Paterno, :Apellido_Materno, :Telefono, :Mail, :Direccion, presence: {message:"debe estar llenado"}
    validates :Nombre, :Apellido_Paterno, :Apellido_Materno, format: { with: /\A[a-zA-Z]+\z/, message: "solo acepta letras" }
    validates :Nombre, length: { in: 2..50 , message: "tiene que tener minimo 2 letras"}
    validates :Apellido_Materno, length: { in: 2..20 , message: "Tiene que tener minimo 2 letras y maximo 20"}
    validates :Apellido_Paterno, length: { in: 2..20 , message: "Tiene que tener minimo 2 letras y maximo 20"}
    validates :Telefono, numericality: { only_integer: true , message:"solo acepta Números"}
    validates :Telefono, length: {is: 8 , message: "Tiene que tener 8 numeros"}
    validates :Telefono, numericality: {in: 60000000..79999999 , message: "Tiene que empezar con 6 o 7"}
    validates :Mail, email_format: { message: 'tiene que ser como el siguiente ejemplo, juan@example.com' }
    
     

     
end
