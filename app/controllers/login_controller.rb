class LoginController < ApplicationController
        def formulario_login
            session[:userlog]=nil
            session[:vendedo]=nil
        end
        def f
            session[:userlog]=nil
            session[:vendedo]=nil
            render "formulario_login"
        end
        def login
            
            usuario=Supervisor.where(Mail:  params[:ail]).first

                Supervisor.all.each do |su|
                    if params[:ail]==su.Mail
                        usuario=su
                    end
                end

            if usuario !=nil && usuario.Teléfono.to_s==params[:password]
                session[:userlog]=usuario.id
                
                redirect_to supervisors_path
                
                    
                        
                        
                    
                
            else
                
                if params[:ail] == "juantopo@gmail.com" && params[:password]=="74185296"
                    session[:userlog]=-1
                    redirect_to vendedors_path
                else
                #if usuario.vendedor?
                    #render template: "vendedors/index"
                #else
                Vendedor.all.each do |su|
                        if params[:ail]==su.Mail
                            usuario=su
                        end
                    end
                    if usuario !=nil && usuario.Telefono.to_s==params[:password]
                        session[:vendedo]=usuario.id
                        redirect_to catalogos_path
                    else
                                if params[:ail] == "" || params[:password] == ""
                                        @error = "Todos los compos son obligatorios"
                                        render "formulario_login"#"formulario_login"
                                else
                                    if params[:ail].length() >21
                                        @errora = "Maximo 21 caracteres"
                                    end
                                    if params[:password].length() <6
                                        @errorb = "Minimo 6 caracteres"
                                    end
                                
                                            @error = "Usuario o contraseña invalidos"
                                            render "formulario_login"#"formulario_login"
                                    
                                end
                    end
                end
            end

        end




    

end