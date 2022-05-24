class Validar_Nombre3 < ActiveModel::Validator
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
                        record.errors.add(:Nombre, "*Solo se acepta 1 espacio después de un Nombre ")
                    else

                            if record.Nombre =~ /\A[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]{2,}(?:[\s-]{1}[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]{1,}){3,}(?:[\s-])?\z/
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

    #validaciones de apellido p
    if record.Apellido_Paterno==nil || record.Apellido_Paterno==""
        record.errors.add(:"Apellido_Paterno", "*Campo obligatorio")
    else
        if record.Apellido_Paterno =~ /\A[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]{2,}(?:[\s-]{1}[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]{2,})?(?:[\s-])?\z/
            if record.Apellido_Paterno.length()>21 
                record.errors.add(:"Apellido_Paterno", "*Tiene que tener máximo 21 caracteres")
            end
        else 
            if record.Apellido_Paterno.start_with?(" ")
                record.errors.add(:Apellido_Paterno, "*No debe iniciar con un espacio")
            else
                if record.Apellido_Paterno =~ /\s\s+/
                    record.errors.add(:Apellido_Paterno, "*Solo se acepta 1 espacio después de un Apellido")
                else
                    if record.Apellido_Paterno =~ /\A[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]{2,}(?:[\s-]{1}[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]{1,}){2,}(?:[\s-])?\z/
                        record.errors.add(:Apellido_Paterno, "*Solo acepta máximo 2 palabras")
                    else
                        if record.Apellido_Paterno =~ /[0-9]/
                            record.errors.add(:Apellido_Paterno, "*Solo acepta letras ")

                        else
                        
                            if record.Apellido_Paterno =~ /[^a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC\s]/
                                record.errors.add(:Apellido_Paterno, "*Solo acepta letras ")
                            else
                        
                                if record.Apellido_Paterno =~ /[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]/ 
                                    record.errors.add(:Apellido_Paterno, "*Cada Apellido debe tener mínimo 2 letras")

                                else
                                
                                    record.errors.add(:Apellido_Paterno, "*Solo acepta letras ")
                                end
                            end
                        end
                            
                    end
                end
            end
        end
    end

    #validaciones apellido m
    if record.Apellido_Materno==nil || record.Apellido_Materno==""
        record.errors.add(:"Apellido_Materno", " *Campo obligatorio")
    else
        if record.Apellido_Materno =~ /\A[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]{2,}(?:[\s-]{1}[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]{2,})?(?:[\s-])?\z/
            if record.Apellido_Materno.length()>21 
                record.errors.add(:"Apellido_Materno", "*Tiene que tener máximo 21 caracteres")
            end
        else 
            if record.Apellido_Materno.start_with?(" ")
                record.errors.add(:Apellido_Materno, "*No debe iniciar con un espacio")
            else
                if record.Apellido_Materno =~ /\s\s+/
                    record.errors.add(:Apellido_Materno, "*Solo se acepta 1 espacio después de un Apellido")
                else
                    if record.Apellido_Materno =~ /\A[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]{2,}(?:[\s-]{1}[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]{1,}){2,}(?:[\s-])?\z/
                        record.errors.add(:Apellido_Materno, "*Solo acepta máximo 2 palabras")
                    else
                        if record.Apellido_Paterno =~ /[0-9]/
                            record.errors.add(:Apellido_Materno, "*Solo acepta letras ")
                        else
                            if record.Apellido_Materno =~ /[^a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC\s]/
                                record.errors.add(:Apellido_Materno, "*Solo acepta letras ")
                            else
                        
                                if record.Apellido_Materno =~ /[a-zA-Z-ÿ\u00f1\u00d1\u00E0-\u00FC\u00DC]/ 
                                    record.errors.add(:Apellido_Materno, "*Cada Apellido debe tener mínimo 2 letras")

                                else
                                
                                    record.errors.add(:Apellido_Materno, "*Solo acepta letras ")
                                end
                            end
                        end
                            
                    end
                end
            end
        end
    end

    #validaciones telefono
  
    
if record.Telefono==nil || record.Telefono==""
    record.errors.add(:Teléfono, "*Campo obligatorio")
else
    if record.Telefono > -1
    
        if record.Telefono.digits.count()==8
            Supervisor.all.each do |ss|
                if record.Telefono==ss.Teléfono
                    record.errors.add(:"Telefono", "*Ya existe este número")
                end
            end
            
            Company.all.each do |ss|
                if record.Telefono==ss.telefono
                    record.errors.add(:"Telefono", "*Ya existe este número")
                end
            end
            if record.Telefono.to_s=="74185296"
                record.errors.add(:"Telefono", "*Ya existe este número")
            end
            if record.Telefono > 59999999 && record.Telefono < 80000000 
                
                
            else
                   record.errors.add(:Teléfono,"*Tiene que empezar con el dígito 6 o 7")

              
            end
        else
            record.errors.add(:Teléfono,"*Tiene que tener 8 dígitos")
        end
    else
        record.errors.add(:Teléfono,"*Solo acepta dígitos positivos")
    end
end
#validaciones de Mail
if record.Mail==nil || record.Mail==""
    record.errors.add(:"Mail", "*Campo obligatorio")
else
    

    
    if record.Mail =~ /\A\w+(\.*)\w*+([@\s]*)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
        Supervisor.all.each do |ss|
            if record.Mail==ss.Mail
                record.errors.add(:"Mail", "*Ya existe este Mail")
            end
        end
        
        Company.all.each do |ss|
            if record.Mail==ss.mail
                record.errors.add(:"Mail", "*Ya existe este Mail")
            end
        end
        if record.Mail=="juantopo@gmail.com"
            record.errors.add(:"Mail", "*Ya existe este Mail")
        end
        
    else 
        if record.Mail.start_with?(" ")
            record.errors.add(:Mail, "*No debe iniciar con un espacio")
        else
            
                if record.Mail =~ /\W/
                    record.errors.add(:"Mail", "*Se esta ingresando caracteres especiales no validos")
                else
                    

                    

                    
                        
                    
                        record.errors.add(:"Mail", "*Tiene que ser como el siguiente ejemplo: juan@example.com")
                    
                end
            
        end
        
    end
end
#validaciones de direccion
if record.Direccion==nil || record.Direccion==""
    record.errors.add(:"Dirección", "*Campo obligatorio")
else
    if record.Direccion =~ /https:\/\/goo.gl\/maps/ || record.Direccion =~ /https:\/\/maps.app.goo.gl/
        req=nil
            req = Net::HTTP.get_response(URI(record.Direccion))
            
            case req
            when Net::HTTPSuccess then
              req
            when Net::HTTPRedirection then
                
              #location = req['location']
              #warn "redirected to #{location}"
              #fetch(location, limit - 1)
            else
                record.errors.add(:Dirección, "*Debe poner un link correcto")
            end
    else 
        if record.Direccion.start_with?(" ")
            record.errors.add(:Dirección, "*No debe iniciar con un espacio")
        else
            record.errors.add(:"Dirección", "*Tiene que ser un link de google maps")
            
        end
        
    end
end



end
end


class Vendedor < ApplicationRecord
include ActiveModel::Validations
    has_one_attached :imagen
    mount_uploader :perfil, PerfilUploader
    
    validates_with Validar_Nombre3 
    validates :Telefono, :Mail, uniqueness: {message:"*Ya existe este en la base de datos"}
    
    validate :formato_correcto

    private 
    def formato_correcto
        if imagen.attached? && !imagen.content_type.in?(%w(image/png image/jpg image/jpeg))
            errors.add(:imagen,'*Debe ser un jpg,jpeg o png')
        end
    end
    
end
