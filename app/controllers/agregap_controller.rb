class AgregapController < ApplicationController
    def agregapro
        if session[:vendedo]!=nil && session[:pedido]!=nil
      
        else
            redirect_to catalogos_path
        end
    end
    def agregap
        p=nil
        pp=nil

        Catalogo.all.each do |su|    
            if params["#{su.nombre}"]!="" && params["#{su.nombre}"]!=nil
                if p==nil
                p= su
                else
                    pp=su
                end  
            end            
        end
    if  p!=nil
    if pp!=nil && session[:recarga2]==params["#{pp.nombre}"]
        @pend = ""
        session[:recarga2]=params["#{pp.nombre}"]
        render "agregapro"
    else
        
        if params["#{p.nombre}"] =~ /[\D]/ || pp!= nil && params["#{pp.nombre}"] =~ /[\D]/
            if session[:recarga]!=params["#{p.nombre}"] ||  pp!= nil && session[:recarga2]!=params["#{pp.nombre}"] 
                @pend = "*Solo debe ingresar dígitos númericos enteros"
                session[:recarga]=params["#{p.nombre}"]    
                if   pp!=nil
                session[:recarga2]=params["#{pp.nombre}"]              
                end

                
            else
                @pend=""
                
            end
            render "agregapro"
        else
        
        

            if pp!=nil
                @pend = "*Solo debe ingresar la catidad de un producto a la vez"
                session[:recarga2]=params["#{pp.nombre}"]
                render "agregapro"
            else
                if session[:recarga]!=params["#{p.nombre}"]
                    
                        
                            
                                g = params["#{p.nombre}"]
                                if g.to_i == 0
                                    @pend = "*Debe ingresar una cantidad mayor a 0"
                                    session[:recarga]=params["#{p.nombre}"]
                                    render "agregapro"
                                else

                                
                                rpedido = Rpedido.find(session[:pedido])
                                detalle = Detallep.new
                                detalle.cantidad = g.to_i
                                detalle.catalogo = p
                                
                                detalle.save
                                rpedido.detallep.push(detalle)
                                rpedido.save
                                
                                
                            
                                session[:recarga]=nil
                                session[:recarga2]=nil
                            
                                    redirect_to rpedido_path(session[:pedido])
                                
                                end
                        
                    
                else
                    session[:recarga]=params["#{p.nombre}"]
                    @pend=nil
                    render "agregapro"
                end
            end
         end
        end
    else
        if  session[:recarga]==-1
            @pend= ""            
        else
        @pend= "*Cantidad no ingresada"
        session[:recarga]=-1
        end
        render "agregapro"
    end

    end
end
