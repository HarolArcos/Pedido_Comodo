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
                                     if record.nombre != /[^a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC\s]/ 
                                         record.errors.add(:nombre, "*No se permiten caracteres especiales")
                                     else
                                 
                                         if record.nombre =~ /[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]/ 
                                             record.errors.add(:nombre, "*Cada nombre debe tener mínimo 2 letras")
 
                                         else
                                         
                                             #record.errors.add(:nombre, "*Solo acepta letras ")
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
        if record.codigo =~ /\D/
            
                    record.errors.add(:codigo,"*Solo acepta dígitos numéricos")
                    
        
           
        else
            




                if record.codigo.to_i.digits.count() < 6
                    if record.codigo.to_i > 99 && record.codigo.to_i < 100000 
                        
                        
                    else
                           record.errors.add(:codigo,"*El código debe tener como mínimo 3 dígitos")
        
                      
                    end
                else
                    record.errors.add(:codigo,"*El código debe tener como máximo 5 dígitos")
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
            else
                empr=nil
                Company.all.each do |ss|
                    
                    if record.empresa==ss.nombre
                        empr=ss
                    end
                end
                if empr!=nil
                else
                    record.errors.add(:"empresa", "*La empresa no existe en la base de datos")
                end
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
        if record.precio =~ /[^0-9\.]/
            
                    record.errors.add(:precio,"*Solo acepta dígitos numéricos")
                    
                
        else
            if record.precio =~ /\A\d+(\.{1}\d{1,2}){0,1}\z/
                if record.precio.to_f <= 0
                    record.errors.add(:precio,"*El valor mínimo de un producto es de 1 Bs.")
                    else


                    if record.precio.to_f < 10000    
                    else
                        record.errors.add(:precio,"*El máximo valor de un producto es 9999.99 Bs.")
        
                    end
                end
            else
                record.errors.add(:precio,"*El valor debe de ser escrito de forma [xxxx.xx] .")
            
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
    has_many :detallep
    
    
    validates_with Validar_Catalogo
    validates :nombre, :codigo, uniqueness: {message:"*Ya existe producto"}
    
    

    
    
end