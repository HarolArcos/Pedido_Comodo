class Validar_Nombree < ActiveModel::Validator
    def validate (record)
       #validaciones de Nombre
       if record.Nombre==nil || record.Nombre=="" 
        record.errors.add(:Nombre, "*Campo obligatorio")
    else
        
            if record.Nombre =~ /\A[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]{2,}(?:[\s-]{1}[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]{2,})?(?:[\s-]{1}[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]{2,})?(?:[\s-])?\z/
                if record.Nombre.length()>21 
                    record.errors.add(:Nombre, "*Tiene que tener máximo 21 caracteres")
                end
            else 
                if record.Nombre.start_with?(" ")
                    record.errors.add(:Nombre, "*No debe iniciar con un espacio")
                else
                    if record.Nombre =~ /\s\s+/
                        record.errors.add(:Nombre, "*Solo se acepta 1 espacio despues de una palabra")
                    else

                            if record.Nombre =~ /\A[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]{2,}(?:[\s-]{1}[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]{1,}){3,}(?:[\s-])?\z/
                                #/\A[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC]{2,}(?:[\s-]{1}[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC]{2,})?(?:[\s-]{1}[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC]{2,})+(?:[\s-])+\z/
                                record.errors.add(:Nombre, "*Solo acepta máximo 3 palabras")
                                
                            else
                                
                                if record.Nombre =~ /\d/
                                    record.errors.add(:Nombre, "*Solo acepta letras ")

                                else
                                    if record.Nombre =~ /[^a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC\s]/
                                        record.errors.add(:Nombre, "*Solo acepta letras ")
                                    else
                                
                                        if record.Nombre =~ /[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]/ 
                                            record.errors.add(:Nombre, "*Cada nombre debe tener mínimo 2 letras")

                                        else
                                        
                                            record.errors.add(:Nombre, "*Solo acepta letras ")
                                        end
                                    end
                                end
                                    
                            end
                     end
                end
            end        
    end
   
       #validaciones de responsable


       if record.Responsable==nil || record.Responsable==""
        record.errors.add(:Responsable, "*Campo obligatorio")
    else
        
            if record.Responsable =~ /\A[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC]{2,}(?:[\s-]{1}[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC]{2,})?(?:[\s-]{1}[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC]{2,})?(?:[\s-])?\z/
                if record.Responsable.length()>21 
                    record.errors.add(:Responsable, "*Tiene que tener máximo 21 caracteres")
                end
            else 
                if record.Responsable.start_with?(" ")
                    record.errors.add(:Responsable, "*No debe iniciar con un espacio")
                else
                    if record.Responsable =~ /\s\s+/
                        record.errors.add(:Responsable, "*Solo se acepta 1 espacio despues de una palabra")
                    else

                            if record.Responsable =~ /\A[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]{2,}(?:[\s-]{1}[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]{1,}){3,}(?:[\s-])?\z/
                                #/\A[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC]{2,}(?:[\s-]{1}[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC]{2,})?(?:[\s-]{1}[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC]{2,})+(?:[\s-])+\z/
                                record.errors.add(:Responsable, "*Solo acepta máximo 3 palabras")
                                
                            else
                                
                                if record.Responsable =~ /[0-9]/
                                    record.errors.add(:Responsable, "*Solo acepta letras ")

                                else
                                
                                    if record.Responsable =~ /[a-zA-Z]/ 
                                        record.errors.add(:Responsable, "*Cada nombre debe tener mínimo 2 letras")

                                    else
                                    
                                        record.errors.add(:Responsable, "*Solo acepta letras ")
                                    end
                                end
                                    
                            end
                     end
                end
            end
        
    end


       #validaciones telefono
       
   if record.Telefono==nil || record.Telefono==""
       record.errors.add(:Telefono, "*Campo obligatorio")
   else
       if record.Telefono > 0
       
           if record.Telefono.digits.count()==8
               if record.Telefono > 59999999 && record.Telefono < 80000000 
                   
                   
               else
                      record.errors.add(:Telefono,"*Tiene que empezar con el dígito 6 o 7")
   
                 
               end
           else
               record.errors.add(:Telefono,"*Tiene que tener 8 dígitos")
           end
       else
           record.errors.add(:Telefono,"*Solo acepta dígitos numéricos")
       end
   end
   #validaciones de Mail
   if record.Mail==nil || record.Mail==""
    record.errors.add(:"Mail", "*Campo obligatorio")
    else
        if record.Mail =~ /\A\w+(\.*)\w*+([@\s]*)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
        
        else 
            if record.Mail.start_with?(" ")
            record.errors.add(:Mail, "*No debe iniciar con un espacio")
            else
            record.errors.add(:"Mail", "*Tiene que ser como el siguiente ejemplo: juan@example.com")
            
            end
        
        end
    end


   #validaciones de direccion
   if record.Direccion==nil || record.Direccion==""
       record.errors.add(:"Direccion", "*Campo obligatorio")
   else
       if record.Direccion =~ /https:\/\/goo.gl\/maps/ || record.Direccion =~ /https:\/\/maps.app.goo.gl/
           
       else 
        if record.Direccion.start_with?(" ")
            record.errors.add(:Direccion, "*No debe iniciar con un espacio")
        else
           record.errors.add(:"Direccion", "*Tiene que ser un link de google maps")
        end
       end
   end
   
   
   
   end
   end
   
   
   class Rventum < ApplicationRecord
   include ActiveModel::Validations
       has_one_attached:imagen
       mount_uploader :perfil, PerfilUploader
       
       validates_with Validar_Nombree 
       validates :Telefono, :Mail, uniqueness: {message:"*Ya existe un registro de venta con esta información"}
       
       validate :formato_correcto

       private 
       def formato_correcto
        if imagen.attached?
             if !imagen.content_type.in?(%w(image/png image/jpg image/jpeg))
                 errors.add(:imagen,'*Debe ser un jpg,jpeg o png')
             end
        else 
             errors.add(:imagen, '*Debe tener imagen')
        end
    end
       
   end
   