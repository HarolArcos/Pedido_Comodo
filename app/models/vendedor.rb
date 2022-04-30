class Validar_Nombre3 < ActiveModel::Validator
 def validate (record)
    #validaciones de Nombre
    if record.Nombre==nil || record.Nombre==""    
        record.errors.add(:Nombre, "debe estar llenado")
    else
        if record.Nombre =~ /\A[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC]{2,}(?:[\s-]*[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC]{2,})?(?:[\s-]*[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC]{2,})?(?:[\s-])?\z/
            if record.Nombre.length()>21 
                record.errors.add(:Nombre, "tiene que tener maximo 21 caracteres")
            end
        else 
            record.errors.add(:Nombre, "solo acepta letras y máximo 3 palabras, cada palabra debe tener mínimo 2 letras")
        end
    end

    #validaciones de apellido p
    if record.Apellido_Paterno==nil || record.Apellido_Paterno==""
        record.errors.add(:"Apellido_Paterno", " debe estar llenado")
    else
        if record.Apellido_Paterno =~ /\A[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC]{2,}(?:[\s-]*[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC]{2,})?(?:[\s-])?\z/
            if record.Apellido_Paterno.length()>21 
                record.errors.add(:"Apellido_Paterno", " tiene que tener maximo 21 caracteres")
            end
        else 
            record.errors.add(:"Apellido_Paterno", " solo acepta letras y máximo 2 palabras, cada palabra debe tener mínimo 2 letras")
        end
    end

    #validaciones apellido m
    if record.Apellido_Materno==nil || record.Apellido_Materno==""
        record.errors.add(:"Apellido_Materno", "  debe estar llenado")
    else
        if record.Apellido_Materno =~ /\A[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC]{2,}(?:[\s-]*[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC]{2,})?(?:[\s-])?\z/
            if record.Apellido_Materno.length()>21 
                record.errors.add(:"Apellido_Materno", " tiene que tener maximo 21 caracteres")
            end
        else 
            record.errors.add(:"Apellido_Materno", " solo acepta letras y máximo 2 palabras, cada palabra debe tener mínimo 2 letras")
        end
    end

    #validaciones telefono
  
    
if record.Telefono==nil || record.Telefono==""
    record.errors.add(:Teléfono, "debe estar llenado")
else
    if record.Telefono > 0
    
        if record.Telefono.digits.count()==8
            if record.Telefono > 59999999 && record.Telefono < 80000000 
                
                
            else
                   record.errors.add(:Teléfono,"tiene que empezar con el digito 6 o 7")

              
            end
        else
            record.errors.add(:Teléfono,"tiene que tener 8 digitos")
        end
    else
        record.errors.add(:Teléfono,"solo acepta digitos numericos")
    end
end
#validaciones de Mail
if record.Mail==nil || record.Mail==""
    record.errors.add(:"Mail", "debe estar llenado")
else
    if record.Mail =~ /\A\w+(\.*)\w*+([@\s]*)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
        
    else 
        record.errors.add(:"Mail", "tiene que ser como el siguiente ejemplo: juan@example.com")
    end
end
#validaciones de direccion
if record.Direccion==nil || record.Direccion==""
    record.errors.add(:"Dirección", "debe estar llenado")
else

    if record.Direccion =~ /https:\/\/goo.gl\/maps/
        
    else 
        record.errors.add(:"Dirección", "tiene que ser un link de google maps")
    end
end



end
end


class Vendedor < ApplicationRecord
include ActiveModel::Validations
    has_one_attached:imagen
    mount_uploader :perfil, PerfilUploader
    
    validates_with Validar_Nombre3 
    validates :Telefono, :Mail, uniqueness: {message:"ya existe usuario"}
    
    validate :formato_correcto

    private 
    def formato_correcto
        if imagen.attached? && !imagen.content_type.in?(%w(image/png image/jpg image/jpeg))
            errors.add(:imagen,' debe ser un jpg,jpeg o png')
        end
    end
    
end
