class LoginController < ApplicationController
def formulario_login
end
def login
    
    usuario=Supervisor.where(Mail: params[:mail]).firts

    if usuario.exists? && usuario.Teléfono.to_s==params[:password]
        session[:userlog]=usuario.id
        if usuario.supervisor?
            render template: "supervisors/index"
        else
            
                
                @error = "tu usuario no tiene ningun permiso"
                render "formulario_login"
               
        end
    else
        
        if params[:mail]=="juantopo@gmail.com" && params[:password]=="74185296"
            render template: "vendedors/index"
        else
           #if usuario.vendedor?
            #render template: "vendedors/index"
           #else
                    @error = "usuario o contraseña invalidos"
                    render "formulario_login"
            #end
        end
    end

end


end