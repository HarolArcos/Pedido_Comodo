class Validar_Nombre < ActiveModel::Validator
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

       #validaciones codigo

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
        validates_with Validar_Nombre   
        validates :telefono,  uniqueness: {message:"ya existe usuario"} 
    end