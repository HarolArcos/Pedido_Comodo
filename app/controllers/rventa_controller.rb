class RventaController < ApplicationController
  before_action :set_rventum, only: %i[ show edit update destroy ]

  # GET /rventa or /rventa.json
  def index
    @rventa = Rventum.all
  end

  # GET /rventa/1 or /rventa/1.json
  def show
  end

  # GET /rventa/new
  def new
    if session[:userlog]!=nil && session[:userlog]!=-1
          
          
             #|| usuario.supervisor?
             @rventum = Rventum.new
            
              
              
              
           
          
    else
      if session[:userlog]==-1
        @rventum = Rventum.new
      else
      render template: "login/formulario_login"
    end
    end
  end

  # GET /rventa/1/edit
  def edit
  end

  # POST /rventa or /rventa.json
  def create
    if session[:userlog]==-1
    
      @rventum = Rventum.new(rventum_params)

    respond_to do |format|
      if @rventum.save
          format.html { redirect_to vendedors_path, notice: "El Punto de venta fue registrado" }
          format.json { render :show, status: :created, location: @vendedor }
       else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @vendedor.errors, status: :unprocessable_entity }
       end
      end
    else
      @rventum = Rventum.new(rventum_params)

    respond_to do |format|
      if @rventum.save
          format.html { redirect_to supervisors_path, notice: "El Punto de venta fue registrado" }
          format.json { render :show, status: :created, location: @vendedor }
       else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @vendedor.errors, status: :unprocessable_entity }
       end
      end
    end
   
  end
  

  # PATCH/PUT /rventa/1 or /rventa/1.json
  def update
    respond_to do |format|
      if @rventum.update(rventum_params)
        format.html { redirect_to rventum_url(@rventum), notice: "Rventum was successfully updated." }
        format.json { render :show, status: :ok, location: @rventum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rventum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rventa/1 or /rventa/1.json
  def destroy
    @rventum.destroy

    respond_to do |format|
      format.html { redirect_to rventa_url, notice: "Rventum was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rventum
      @rventum = Rventum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rventum_params
      params.require(:rventum).permit(:Nombre, :Responsable, :Telefono, :Mail, :Direccion, :imagen)
    end
end