class LoginController < ApplicationController
def formulario_login
    session[:userlog]=nil
end
def f
    session[:userlog]=nil
    render "formulario_login"
end
def login
    
    usuario=Supervisor.where(Mail: params[:mail]).first
     puts params[:mail]
    if usuario !=nil #&& usuario.Teléfono==params[:password]
        session[:userlog]=usuario.id
        if usuario.supervisor?
            render template: "supervisors/index"
        else
            
                
                @error = "tu usuario no tiene ningun permiso"
                render "formulario_login"
               
        end
    else
        
        if params[:mail] != "juantopo@gmail.com" #&& params[:password]=="74185296"
            session[:userlog]=-1
            render template: "vendedors/index"
        else
           #if usuario.vendedor?
            #render template: "vendedors/index"
           #else
           
                    @error = "usuario o contraseña invalidos"
                    render "formulario_login"#"formulario_login"
            #end
        end
    end

end


end