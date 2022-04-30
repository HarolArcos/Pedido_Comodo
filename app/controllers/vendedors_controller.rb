class VendedorsController < ApplicationController
  before_action :set_vendedor, only: %i[ show edit update destroy upload]


  # GET /vendedors or /vendedors.json
  def index
    #if session[:userlog]!=nil
     # usuario=Supervisor.find(session[:userlog])
      #if usuario.exists? 
       # if usuario.supervisor? #|| usuario.supervisor?
          @vendedors = Vendedor.all
        #else
         # if session[:userlog]==-1
          #  @vendedors = Vendedor.all
          #else
          #render template: "login/formulario_login"
          #end
#        end
 #     else
  #      render template: "login/formulario_login"
   #   end
#else
 # render template: "login/formulario_login"
#end
    
end

  # GET /vendedors/1 or /vendedors/1.json
  def show
  end

  # GET /vendedors/new
  def new
    if session[:userlog]!=nil && session[:userlog]!=-1
          
          
             #|| usuario.supervisor?
              @vendedor = Vendedor.new
            
              
              
              
           
          
    else
      if session[:userlog]==-1
        @vendedor = Vendedor.new
      else
      render template: "login/formulario_login"
    end
    end
  end

  # GET /vendedors/1/edit
  def edit
  end

  # POST /vendedors or /vendedors.json
  def create
    if session[:userlog]==-1
    
      @vendedor = Vendedor.new(vendedor_params)

      respond_to do |format|

      
        if @vendedor.save
          format.html { redirect_to vendedors_path, notice: "El vendedor fue creado" }
          format.json { render :show, status: :created, location: @vendedor }
       else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @vendedor.errors, status: :unprocessable_entity }
       end
      end
    else
      @vendedor = Vendedor.new(vendedor_params)

      respond_to do |format|

      
        if @vendedor.save
          format.html { redirect_to supervisors_path, notice: "El vendedor fue creado" }
          format.json { render :show, status: :created, location: @vendedor }
       else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @vendedor.errors, status: :unprocessable_entity }
       end
      end
    end
   
  end

  # PATCH/PUT /vendedors/1 or /vendedors/1.json
  def update
    
     respond_to do |format|
       if @vendedor.update(vendedor_params)
         format.html { redirect_to vendedors_path, notice: "El vendedor fue actualizado" }
          format.json { head :no_content}
        else
          format.html { render :edit, status: :unprocessable_entity }
         format.json { render json: @vendedor.errors, status: :unprocessable_entity }
        end
      end
    
  end

  # DELETE /vendedors/1 or /vendedors/1.json
  def destroy
    @vendedor.destroy

    respond_to do |format|
      format.html { redirect_to vendedors_url, notice: "Vendedor was successfully destroyed." }
      format.json { head :no_content }
    end
  end



  def upload
    uploaded_file = params[:perfil]
    File.open(Rails.root.join('public', 'uploads', uploaded_file.original_filename), 'wb') do |file|
      file.write(uploaded_file.read)
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vendedor
      @vendedor = Vendedor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vendedor_params
      params.require(:vendedor).permit(:Nombre, :Apellido_Paterno, :Apellido_Materno, :Telefono, :Mail, :Direccion, :perfil, :imagen)
    end
end
