class Validar_Nombree < ActiveModel::Validator
    def validate (record)
       #validaciones de Nombre
       if record.Nombre==nil || record.Nombre=="" 
        record.errors.add(:Nombre, "* Debe estar llenado")
    else
        
            if record.Nombre =~ /\A[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC]{2,}(?:[\s-]{1}[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC]{2,})?(?:[\s-]{1}[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC]{2,})?(?:[\s-])?\z/
                if record.Nombre.length()>21 
                    record.errors.add(:Nombre, "*Tiene que tener máximo 21 caracteres")
                end
            else 
                if record.Nombre.start_with?(" ")
                    record.errors.add(:Nombre, "*No debe iniciar con un espacio")
                else
                    if record.Nombre =~ /\s\s+/
                        record.errors.add(:Nombre, "*Solo se acepta 1 espacio despues de un Nombre ")
                    else

                            if record.Nombre =~ /\A[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC]{2,}(?:[\s-]{1}[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC]{2,})?(?:[\s-]{1}[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC]{2,})?(?:[\s-]{1}[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC]{2,})?(?:[\s-]{1}[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC]{2,})?(?:[\s-])?\z/
                                #/\A[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC]{2,}(?:[\s-]{1}[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC]{2,})?(?:[\s-]{1}[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC]{2,})+(?:[\s-])+\z/
                                record.errors.add(:Nombre, "*Solo acepta máximo 3 palabras")
                            else
                                
                                if record.Nombre =~ /[0-9]/
                                    record.errors.add(:Nombre, "*Solo acepta letras ")

                                else
                                
                                    if record.Nombre =~ /[a-zA-Z]/ 
                                        record.errors.add(:Nombre, "*Cada nombre deve tener mínimo 2 letras")

                                    else
                                    
                                        record.errors.add(:Nombre, "*Solo acepta letras ")
                                    end
                                end
                                    
                            end
                     end
                end
            end
        
    end
   
       #validaciones de responsable

       
       if record.Responsable==nil || record.Responsable==""
           record.errors.add(:"Responsable", " debe estar llenado")
       else
           if record.Responsable =~ /\A[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC]{2,}(?:[\s-]*[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC]{2,})?(?:[\s-])?\z/
               if record.Responsable.length()>21 
                   record.errors.add(:"Responsable", " tiene que tener maximo 21 caracteres")
               end
           else 
               record.errors.add(:"Responsable", " solo acepta letras y máximo 2 palabras, cada palabra debe tener mínimo 2 letras")
           end
       end


       #validaciones telefono
       
   if record.Telefono==nil || record.Telefono==""
       record.errors.add(:Telefono, "debe estar llenado")
   else
       if record.Telefono > 0
       
           if record.Telefono.digits.count()==8
               if record.Telefono > 59999999 && record.Telefono < 80000000 
                   
                   
               else
                      record.errors.add(:Telefono,"tiene que empezar con el digito 6 o 7")
   
                 
               end
           else
               record.errors.add(:Telefono,"tiene que tener 8 digitos")
           end
       else
           record.errors.add(:Telefono,"solo acepta digitos numericos")
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
       record.errors.add(:"Direccion", "debe estar llenado")
   else
       if record.Direccion =~ /https:\/\/goo.gl\/maps/
           
       else 
           record.errors.add(:"Direccion", "tiene que ser un link de google maps")
       end
   end
   
   
   
   end
   end
   
   
   class Rventum < ApplicationRecord
   include ActiveModel::Validations
       has_one_attached:imagen
       mount_uploader :perfil, PerfilUploader
       
       validates_with Validar_Nombree 
       validates :Telefono, :Mail, uniqueness: {message:"ya existe usuario"}
       
       validate :formato_correcto
   
       private 
       def formato_correcto
           if imagen.attached? && !imagen.content_type.in?(%w(image/png image/jpg image/jpeg))
               errors.add(:imagen,' debe ser un jpg,jpeg o png')
           end
       end
       
   end
   