class Validar_Catalogo < ActiveModel::Validator
    def validate (record)
        #validaciones de Nombre
        if record.nombre==nil || record.nombre=="" 
         record.errors.add(:nombre, "*Campo obligatorio")
     else
         
             if record.nombre =~ /\A[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]{2,}(?:[\s-]{1}[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]{2,})?(?:[\s-]{1}[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]{2,})?(?:[\s-])?\z/
                 if record.nombre.length()>21 
                     record.errors.add(:nombre, "*Tiene que tener máximo 21 caracteres")
                 end
             else 
                 if record.nombre.start_with?(" ")
                     record.errors.add(:nombre, "*No debe iniciar con un espacio")
                 else
                     if record.nombre =~ /\s\s+/
                         record.errors.add(:nombre, "*Solo se acepta 1 espacio después de un Nombre ")
                     else
 
                             if record.nombre =~ /\A[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]{2,}(?:[\s-]{1}[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]{1,}){3,}(?:[\s-])?\z/
                                 record.errors.add(:nombre, "*Solo acepta máximo 3 palabras")
                             else
                                 if record.nombre =~ /\d/
                                     record.errors.add(:nombre, "*Solo acepta letras ")
 
                                 else
                                     if record.nombre =~ /[^a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC\s]/
                                         record.errors.add(:nombre, "*Solo acepta letras ")
                                     else
                                 
                                         if record.nombre =~ /[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]/ 
                                             record.errors.add(:nombre, "*Cada nombre debe tener mínimo 2 letras")
 
                                         else
                                         
                                             record.errors.add(:nombre, "*Solo acepta letras ")
                                         end
                                     end
                                 end
                                     
                             end
                      end
                 end
             end
         
     end

     #Validaciones código
     if record.codigo==nil || record.codigo==""
        record.errors.add(:codigo, "*Campo obligatorio")
    else
        if record.codigo > 0
        
            if record.codigo.digits.count() < 6
                if record.codigo > 99 && record.codigo < 100000 
                    
                    
                else
                       record.errors.add(:codigo,"*El código debe tener como mínimo 3 dígitos")
    
                  
                end
            else
                record.errors.add(:codigo,"*El código debe tener como máximo 5 dígitos")
            end
        else
            if record.codigo <= 2
            record.errors.add(:codigo,"*El código debe tener al menos 3 dígitos")
            else
                record.errors.add(:codigo,"*Solo acepta dígitos numéricos")
                end
        end
    end
     #Validaciones empresa
     if record.empresa==nil || record.empresa==""
        record.errors.add(:"empresa", "*Campo obligatorio")
    else
        if record.empresa =~ /\A[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]{2,}(?:[\s-]{1}[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]{2,})?(?:[\s-])?\z/
            if record.empresa.length()>21 
                record.errors.add(:"empresa", "*Tiene que tener máximo 21 caracteres")
            end
        else 
            if record.empresa.start_with?(" ")
                record.errors.add(:empresa, "*No debe iniciar con un espacio")
            else
                if record.empresa =~ /\s\s+/
                    record.errors.add(:empresa, "*Solo se acepta 1 espacio después de un Apellido")
                else
                    if record.empresa =~ /\A[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]{2,}(?:[\s-]{1}[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]{1,}){2,}(?:[\s-])?\z/
                        record.errors.add(:empresa, "*Solo acepta máximo 2 palabras")
                    else
                        if record.empresa =~ /[0-9]/
                            record.errors.add(:empresa, "*Solo acepta letras ")

                        else
                        
                            if record.empresa =~ /[^a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC\s]/
                                record.errors.add(:empresa, "*Solo acepta letras ")
                            else
                        
                                if record.empresa =~ /[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]/ 
                                    record.errors.add(:empresa, "*Cada Apellido debe tener mínimo 2 letras")

                                else
                                
                                    record.errors.add(:empresa, "*Solo acepta letras ")
                                end
                            end
                        end
                            
                    end
                end
            end
        end
    end
     #Validaciones precio
     if record.precio==nil || record.precio==""
        record.errors.add(:precio, "*Campo obligatorio")
    else
        if record.precio > 0
        
            if record.precio.digits.count() < 5
                if record.precio > 0 && record.precio < 1000 
                    
                    
                else
                       record.errors.add(:precio,"*El máximo valor de un producto es 999 Bs.")
    
                  
                end
            else
                record.errors.add(:precio,"*El máximo valor de un producto es 999 Bs.")
            end
        else
            if record.precio <= 0
            record.errors.add(:precio,"*El valor mínimo de un producto es de 1 Bs.")
            else
                record.errors.add(:precio,"*Solo acepta dígitos numéricos")
                end
        end
    end     
     #Validaciones descripcion
     if record.descripcion==nil || record.descripcion==""
        record.errors.add(:"descripcion", "*Campo obligatorio")
    else
            if record.descripcion.length()>100 
                record.errors.add(:"descripcion", "*Tiene que tener máximo 100 caracteres")
            end
        end
    
    
    
    
    end
    end


class Catalogo < ApplicationRecord
    include ActiveModel::Validations
    has_one_attached:imagen
    mount_uploader :perfil, PerfilUploader
    
    validates_with Validar_Catalogo
    validates :nombre, :codigo, uniqueness: {message:"*Ya existe usuario"}
    
    

    private 
    

















    
    
    def supervisor?
     Supervisor.all.each do |supervisor|
         if Mail == supervisor.Mail && Teléfono == supervisor.Teléfono.to_s
         
         return true 
         else
             return false
         end
      end

 end
 def vendedor?
     Vendedor.all.each do |vendedor|
         if Mail == vendedor.Mail && Teléfono == vendedor.Telefono.to_s
         
         return true 
         else
             return false
         end
      end

 end
 def administrador?
     return Mail == "juantopo@gmail.com" 
     
 end
    
end