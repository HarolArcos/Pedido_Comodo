



class Usuario < ApplicationRecord
   
    def supervisor?
        Supervisor.all.each do |supervisor|
            if Mail == supervisor.Mail && Codigo == supervisor.Teléfono.to_s
            
            return true 
            else
                return false
            end
         end

    end
    def vendedor?
        Vendedor.all.each do |vendedor|
            if Mail == vendedor.Mail && Codigo == vendedor.Telefono.to_s
            
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
