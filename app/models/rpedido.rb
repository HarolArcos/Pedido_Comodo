class Validar_Pedido < ActiveModel::Validator
    def validate (record)
       #validaciones de Tiendita
       nombr=nil
       if record.tiendita==nil || record.tiendita=="" 
        record.errors.add(:tiendita, "*Campo obligatorio")
        else
        
            if record.tiendita =~ /\A[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]{2,}(?:[\s-]{1}[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]{2,})?(?:[\s-]{1}[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]{2,})?(?:[\s-])?\z/
                if record.tiendita.length()>21 
                    record.errors.add(:tiendita, "*Tiene que tener máximo 21 caracteres")
                else
                    
                    Rventum.all.each do |nos|
                        
                        if record.tiendita==nos.Nombre
                            
                            nombr=nos
                        end
                    end
                    if nombr!=nil
                    else
                        record.errors.add(:"tiendita", "*El punto de venta no está registrado en la base de datos")
                    end
                end
            else 
                if record.tiendita.start_with?(" ")
                    record.errors.add(:tiendita, "*No debe iniciar con un espacio")
                else
                    if record.tiendita =~ /\s\s+/
                        record.errors.add(:tiendita, "*Solo se acepta 1 espacio después de un Nombre ")
                    else

                            if record.tiendita =~ /\A[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]{2,}(?:[\s-]{1}[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]{1,}){3,}(?:[\s-])?\z/
                                record.errors.add(:tiendita, "*Solo acepta máximo 3 palabras")
                            else
                                if record.tiendita =~ /\d/
                                    record.errors.add(:tiendita, "*Solo acepta letras ")

                                else
                                    if record.tiendita =~ /[^a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC\s]/
                                        record.errors.add(:tiendita, "*Solo acepta letras ")
                                    else
                                
                                        if record.tiendita =~ /[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]/ 
                                            record.errors.add(:tiendita, "*Cada nombre debe tener mínimo 2 letras")

                                        else
                                        
                                            record.errors.add(:tiendita, "*Solo acepta letras ")
                                        end
                                    end
                                end
                                    
                            end
                     end
                end
            end
        
    end

#validaciones de responsable
nombre=nil
    if record.responsable==nil || record.responsable=="" 
        record.errors.add(:responsable, "*Campo obligatorio")
    else
        
            if record.responsable =~ /\A[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]{2,}(?:[\s-]{1}[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]{2,})?(?:[\s-]{1}[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]{2,})?(?:[\s-])?\z/
                if record.responsable.length()>21 
                    record.errors.add(:responsable, "*Tiene que tener máximo 21 caracteres")
                else
                    
                    Rventum.all.each do |no|
                        
                        if record.responsable==no.Responsable
                            nombre=no
                        end
                    end
                    if nombre!=nil
                    else
                        record.errors.add(:"responsable", "*El responsable no está en la base de datos")
                    end
                end
            else 
                if record.responsable.start_with?(" ")
                    record.errors.add(:responsable, "*No debe iniciar con un espacio")
                else
                    if record.responsable =~ /\s\s+/
                        record.errors.add(:responsable, "*Solo se acepta 1 espacio después de un Nombre ")
                    else

                            if record.responsable =~ /\A[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]{2,}(?:[\s-]{1}[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]{1,}){3,}(?:[\s-])?\z/
                                record.errors.add(:responsable, "*Solo acepta máximo 3 palabras")
                            else
                                if record.responsable =~ /\d/
                                    record.errors.add(:responsable, "*Solo acepta letras ")

                                else
                                    if record.responsable =~ /[^a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC\s]/
                                        record.errors.add(:responsable, "*Solo acepta letras ")
                                    else
                                
                                        if record.responsable =~ /[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]/ 
                                            record.errors.add(:responsable, "*Cada nombre debe tener mínimo 2 letras")

                                        else
                                        
                                            record.errors.add(:responsable, "*Solo acepta letras ")
                                        end
                                    end
                                end
                                    
                            end
                    end
                end
            end
        
    end
                if nombr!= nil && nombre!=nil
                    if nombre.id==nombr.id
                    else
                        record.error.add(:pendejo, "*Los campos de no coinciden a un mismo registro")
                    end
                end
   
   end


end
   
   
class Rpedido < ApplicationRecord
    has_many :detallep
    include ActiveModel::Validations
    
    validates_with Validar_Pedido
end
