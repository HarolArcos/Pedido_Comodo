class Validar_Nombre1 < ActiveModel::Validator
    def validate (record)
       #validaciones de Nombre
       if record.nombre==nil || record.nombre==""
           record.errors.add(:Nombre, "debe estar llenado")
       else
           if record.nombre =~ /\A[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC]{2,}(?:[\s-]*[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC]{2,})?(?:[\s-]*[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC]{2,})?(?:[\s-])?\z/
               if record.nombre.length()>21 
                   record.errors.add(:Nombre, "tiene que tener maximo 21 caracteres")
               end
           else 
               record.errors.add(:Nombre, "solo acepta letras y máximo 3 palabras, cada palabra debe tener mínimo 2 letras")
           end
       end

       #validaciones nit
       if record.nit==nil || record.nit==""
        record.errors.add(:nit, "debe estar llenado")
    else
        if record.nit > 0
        
            if record.nit.digits.count()<=21
                if record.nit.digits.count()>6

                else
                    record.errors.add(:nit,"mínimo 6 digitos digitos")
                end
            else
                record.errors.add(:nit,"máximo 21 digitos digitos")
            end
        else
            record.errors.add(:nit,"solo acepta digitos numericos")
        end
    end

    #validaciones de Mail
    if record.mail==nil || record.mail==""
        record.errors.add(:"mail", "debe estar llenado")
    else
        if record.mail =~ /\A\w+(\.*)\w*+([@\s]*)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
        
        else 
            record.errors.add(:"mail", "tiene que ser como el siguiente ejemplo: juan@example.com")
        end
    end
       #validaciondes de telefono
       if record.telefono==nil || record.telefono==""
        record.errors.add(:telefono, "debe estar llenado")
    else
        if record.telefono > 0
        
            if record.telefono.digits.count()==8
                if record.telefono > 59999999 && record.telefono < 80000000 || record.telefono > 43999999 && record.telefono < 45000000
                    
                    
                else
                       record.errors.add(:telefono,"tiene que empezar con el digito 44, 6 o 7")
    
                  
                end
            else
                record.errors.add(:telefono,"tiene que tener 8 digitos")
            end
        else
            record.errors.add(:telefono,"solo acepta digitos numericos")
        end
    end

       #validaciones direccion
       if record.direccion==nil || record.direccion==""
            record.errors.add(:Dirección, "debe estar llenado")
        else
            if record.direccion =~  /https:\/\/goo.gl\/maps/
                if record.direccion.length()>40
                    record.errors.add(:Dirección, "debe tener menos de 40 caracteres")
                end
            else
             record.errors.add(:Dirección,"debe ser un link de google maps")
             end
        end 
   
   
   end
   end

   class Empresa < ApplicationRecord
    include ActiveModel::Validations
        mount_uploader :perfil, PerfilUploader 
        validates_with Validar_Nombre1   
        validates :telefono,  uniqueness: {message:"ya existe usuario"}
        validates :nit,  uniqueness: {message:"ya existe usuario"} 
        validates :mail,  uniqueness: {message:"ya existe usuario"} 
        validates :nombre,  uniqueness: {message:"ya existe usuario"} 
    end