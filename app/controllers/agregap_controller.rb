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
            if pp!=nil
                @pend = "solo deve ingresar la catidad de un producto a la vez"
                render "agregapro"
            else

                g = params["#{p.nombre}"]
                rpedido = Rpedido.find(session[:pedido])
                detalle = Detallep.new
                detalle.cantidad = g.to_i
                detalle.catalogo = p
                
                detalle.save
                rpedido.detallep.push(detalle)
                rpedido.save
                
            
            
            
            redirect_to rpedido_path(session[:pedido])
            end
        else
            @pend= "debe ingresar la cantidad de el producto que sea en su campo"
            render "agregapro"
        end

    end
end
