class Validar_Pedido < ActiveModel::Validator
    def validate (record)
       #validaciones de Tiendita
       if record.tiendita==nil || record.tiendita=="" 
        record.errors.add(:tiendita, "*Campo obligatorio")
    else
        
            if record.tiendita =~ /\A[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]{2,}(?:[\s-]{1}[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]{2,})?(?:[\s-]{1}[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]{2,})?(?:[\s-])?\z/
                if record.tiendita.length()>21 
                    record.errors.add(:tiendita, "*Tiene que tener máximo 21 caracteres")
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
if record.responsable==nil || record.responsable=="" 
    record.errors.add(:responsable, "*Campo obligatorio")
else
    
        if record.responsable =~ /\A[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]{2,}(?:[\s-]{1}[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]{2,})?(?:[\s-]{1}[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]{2,})?(?:[\s-])?\z/
            if record.responsable.length()>21 
                record.errors.add(:responsable, "*Tiene que tener máximo 21 caracteres")
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
   
   
   
   end
   end
   
   
class Rpedido < ApplicationRecord
    include ActiveModel::Validations
    has_one_attached:imagen
    
    validates_with Validar_Pedido
end
