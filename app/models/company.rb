class Validar_Nombre5 < ActiveModel::Validator
    def validate (record)
       #validaciones de Nombre
       if record.nombre==nil || record.nombre=="" 
        record.errors.add(:nombre, "*Campo obligatorio")
    else
        
            if record.nombre =~ /\A[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]{2,}(?:[\s-]{1}[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]{2,})?(?:[\s-]{1}[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]{2,})?(?:[\s-])?\z/
                if record.nombre.length()>21 
                    record.errors.add(:nombre, "*Tiene que tener máximo 21 caracteres")
                end
                a=nil
                Company.all.each do |com|
                    if com.nombre.upcase == record.nombre.upcase
                        a=1
                    end
                end
                if a==1
                record.errors.add(:nombre, "*Ya existe en la base de datos")
                end
            else 
                if record.nombre.start_with?(" ")
                    record.errors.add(:nombre, "*No debe iniciar con un espacio")
                else
                    if record.nombre =~ /\s\s+/
                        record.errors.add(:nombre, "*Solo se acepta 1 espacio después de un Nombre ")
                    else

                            if record.nombre =~ /\A[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]{2,}(?:[\s-]{1}[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]{2,})?(?:[\s-]{1}[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]{2,})+(?:[\s-])?\z/
                                record.errors.add(:nombre, "*Solo acepta máximo 3 palabras")
                            else
                                if record.nombre =~ /[0-9]/
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
   
     #validaciones telefono   
    if record.telefono==nil || record.telefono==""
        record.errors.add(:telefono, "*Campo obligatorio")
    else
        if record.telefono =~ /\D/
            record.errors.add(:telefono,"*Solo acepta dígitos numéricos")
            
        else
            if record.telefono.to_i.digits.count()==8
                if record.telefono.to_i > 59999999 && record.telefono.to_i < 80000000 
                    
                    
                else
                       record.errors.add(:telefono,"*Tiene que empezar con el dígito 6 o 7")
    
                  
                end
            else
                record.errors.add(:telefono,"*Tiene que tener 8 dígitos")
            end
        end
    end
     #validaciones nit  
     if record.nit==nil || record.nit==""
        record.errors.add(:nit, "*Campo obligatorio")
    else
        if record.nit =~ /\D/
            record.errors.add(:nit,"*Solo acepta dígitos numéricos")
        else
            if record.nit.to_i.digits.count()>5
                if record.nit.to_i.digits.count()<22
                    
                else
                       record.errors.add(:nit,"*Tiene que tener máximo 21 dígitos")
                end
            else
                record.errors.add(:nit,"*Tiene que tener mínimo 6 dígitos")
            end
        end
        
    end
   #validaciones de Mail
   if record.mail==nil || record.mail==""
    record.errors.add(:"mail", "*Campo obligatorio")
    else
            if record.mail =~ /\A\w+(\.*)\w*+([@\s]*)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
                
            else 
                if record.mail.start_with?(" ")
                    record.errors.add(:mail, "*No debe iniciar con un espacio")
                else
                    if record.mail =~ /[^\w\.@\s]/
                        record.errors.add(:"mail", "*Se está ingresando caracteres especiales no validos")
                    else
                        record.errors.add(:"mail", "*Tiene que ser como el siguiente ejemplo: juan@example.com")
                    end
                    
                end
                
             end
    end
   #validaciones de direccion
   if record.direccion==nil || record.direccion==""
        record.errors.add(:direccion, "*Campo obligatorio")
    else
        if record.direccion =~ /https:\/\/goo.gl\/maps/ || record.direccion =~ /https:\/\/maps.app.goo.gl/
            #copen esto , cambien el record.direccion por la direccion de la direccion de el correspondiente
            req=nil
            req = Net::HTTP.get_response(URI(record.direccion))
            
            case req
            when Net::HTTPSuccess then
              req
            when Net::HTTPRedirection then
                
              #location = req['location']
              #warn "redirected to #{location}"
              #fetch(location, limit - 1)
            else
                record.errors.add(:direccion, "*Debe poner un link correcto")
            end
            #hasta aqui




            
            

        else 
            if record.direccion.start_with?(" ")
                record.errors.add(:direccion, "*No debe iniciar con un espacio")
            else
                record.errors.add(:direccion, "*Tiene que ser un link de google maps")
                
            end
            
        end
    end
   
   
   
   end
   end
   
   
   class Company < ApplicationRecord
   include ActiveModel::Validations
       
       validates_with Validar_Nombre5
       validates :telefono, :mail, :nit,:direccion, uniqueness: {message:"*Ya existe una empresa con esta información"}
       
   end
