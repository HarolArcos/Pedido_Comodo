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
        validates :telefono, numericality: { only_integer: true , message:"solo acepta números"}  
        validates :telefono, length: {is: 8 , message: "tiene que tener 8 números"}
        validates :telefono, numericality: {in: 60000000..79999999 , message: "tiene que empezar con 6 o 7"}
        validates_with Validar_Nombre    
    end