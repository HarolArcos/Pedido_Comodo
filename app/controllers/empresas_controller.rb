class EmpresasController < ApplicationController
  before_action :set_empresa, only: %i[ show edit update destroy upload ]

  # GET /empresas or /empresas.json
  def index
    @empresas = Empresa.all
  end

  # GET /empresas/1 or /empresas/1.json
  def show
  end

  # GET /empresas/new
  def new
    if session[:userlog]!=nil && session[:userlog]!=-1
          usuario=Supervisor.find(session[:userlog])
          if usuario.exists? 
            if usuario.supervisor? #|| usuario.supervisor?
              @empresa = Empresa.new
            else
              
              render template: "login/formulario_login"
              
            end
          else
            render template: "login/formulario_login"
          end
    else
      if session[:userlog]==-1
        @empresa = Empresa.new
      else
      render template: "login/formulario_login"
    end
    end
  end
    
  
    

  # GET /empresas/1/edit
  def edit
  end

  # POST /empresas or /empresas.json
  def create
    if session[:userlog]==-1
    
      @empresa = Empresa.new(empresa_params)

    respond_to do |format|
      if @empresa.save
        format.html { redirect_to vendedors_path, notice: "Empresa was successfully created." }
        format.json { render :show, status: :created, location: @empresa }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @empresa.errors, status: :unprocessable_entity }
      end
    end
    else
      @empresa = Empresa.new(empresa_params)

    respond_to do |format|
      if @empresa.save
        format.html { redirect_to supervisors_path, notice: "Empresa was successfully created." }
        format.json { render :show, status: :created, location: @empresa }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @empresa.errors, status: :unprocessable_entity }
      end
    end
    end





    
  end

  # PATCH/PUT /empresas/1 or /empresas/1.json
  def update
    respond_to do |format|
      if @empresa.update(empresa_params)
        format.html { redirect_to empresa_url(@empresa), notice: "Empresa was successfully updated." }
        format.json { render :show, status: :ok, location: @empresa }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @empresa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empresas/1 or /empresas/1.json
  def destroy
    @empresa.destroy

    respond_to do |format|
      format.html { redirect_to empresas_url, notice: "Empresa was successfully destroyed." }
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
    def set_empresa
      @empresa = Empresa.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def empresa_params
      params.require(:empresa).permit(:codigo, :nombre, :telefono, :direccion)
    end
end
