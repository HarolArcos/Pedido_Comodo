class Supervisor < ApplicationRecord

    has_one_attached:imagen
    mount_uploader :perfil, PerfilUploader
    validates :Nombre, :Apellido_Paterno, :Apellido_Materno, :Teléfono, :Mail, :Dirección, presence: {message:"debe estar llenado"}
    validates :Nombre, format: { with: /\A[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC]{2,}(?:[\s-]*[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC]{2,})?(?:[\s-]*[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC]{2,})?(?:[\s-])?\z/, message: "solo acepta letras y máximo 3 palabras, cada palabra debe tener mínimo 2 letras" }
    validates :Apellido_Paterno, :Apellido_Materno, format: { with: /\A[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC]{2,}(?:[\s-]*[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC]{2,})?(?:[\s-])?\z/, message: "solo acepta letras y máximo 2 palabras, cada palabra debe tener mínimo 2 letras" }
    validates :Nombre, length: { in: 2..21 , message: "tiene que tener mínimo 2 letras y máximo 21"}
    validates :Apellido_Materno, length: { in: 2..21 , message: "tiene que tener mínimo 2 letras y máximo 21"}
    validates :Apellido_Paterno, length: { in: 2..21 , message: "tiene que tener mínimo 2 letras y máximo 21"}
    validates :Teléfono, numericality: { only_integer: true , message:"solo acepta números"}
    validates :Teléfono, length: {is: 8 , message: "tiene que tener 8 números"}
    validates :Teléfono, numericality: {in: 60000000..79999999 , message: "tiene que empezar con 6 o 7"}
    validates :Mail, email_format: {with: /\A\w+(\.*)\w*+([@\s]*)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: 'tiene que ser como el siguiente ejemplo: juan@example.com' }
    validates :Dirección, length: { in: 10..40 , message: "tiene que tener mínimo 10 letras y máximo 40"}
    validates :Dirección, format: { with: /https:\/\/goo.gl\/maps/, message: "tiene que ser un link de google maps" }
    validates :Teléfono, :Mail, uniqueness: {message:"ya existe usuario"}
    
    validate :formato_correcto

    private 
    def formato_correcto
        if imagen.attached? && !imagen.content_type.in?(%w(image/png image/jpg image/jpeg))
            errors.add(:imagen,' debe ser un jpg o png')
        end
    end
end
