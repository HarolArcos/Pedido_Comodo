class Validar_Nombre < ActiveModel::Validator
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
        record.errors.add(:"Apellido", "Paterno debe estar llenado")
    else
        if record.Apellido_Paterno =~ /\A[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC]{2,}(?:[\s-]*[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC]{2,})?(?:[\s-])?\z/
            if record.Apellido_Paterno.length()>21 
                record.errors.add(:"Apellido", "Paterno tiene que tener maximo 21 caracteres")
            end
        else 
            record.errors.add(:"Apellido", "Paterno solo acepta letras y máximo 2 palabras, cada palabra debe tener mínimo 2 letras")
        end
    end

    #validaciones apellido m
    if record.Apellido_Materno==nil || record.Apellido_Materno==""
        record.errors.add(:"Apellido", " Materno debe estar llenado")
    else
        if record.Apellido_Materno =~ /\A[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC]{2,}(?:[\s-]*[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC]{2,})?(?:[\s-])?\z/
            if record.Apellido_Materno.length()>21 
                record.errors.add(:"Apellido", "Materno tiene que tener maximo 21 caracteres")
            end
        else 
            record.errors.add(:"Apellido", "Materno solo acepta letras y máximo 2 palabras, cada palabra debe tener mínimo 2 letras")
        end
    end

    #validaciones telefono
    if record.Telefono==nil || record.Telefono==""
        record.errors.add(:Teléfono, "debe estar llenado")
    else
        if record.Telefono =~ /\A\d+\z/
            if ((record.Telefono)/(10^(record.Telefono.length()-1)))>=6 && ((record.Telefono)/(10*(record.Telefono.length()-1)))<=7
             record.errors.add(:Teléfono,"pendejo")

            end
        else
         record.errors.add(:Teléfono,"otro pendejo")
         end
    end


end
end


class Vendedor < ApplicationRecord
include ActiveModel::Validations
    has_one_attached:imagen
    mount_uploader :perfil, PerfilUploader
    validates_with Validar_Nombre 
    
    
    validate :formato_correcto

    private 
    def formato_correcto
        if imagen.attached? && !imagen.content_type.in?(%w(image/png image/jpg image/jpeg))
            errors.add(:imagen,' debe ser un jpg o png')
        end
    end
    
end
