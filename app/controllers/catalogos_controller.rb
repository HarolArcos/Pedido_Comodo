class CatalogosController < ApplicationController
  before_action :set_catalogo, only: %i[ show edit update destroy ]

  # GET /catalogos or /catalogos.json
  def index
    @catalogos = Catalogo.all
  end

  # GET /catalogos/1 or /catalogos/1.json
  def show
  end

  # GET /catalogos/new
  def new
    @catalogo = Catalogo.new
  end

  # GET /catalogos/1/edit
  def edit
  end

  # POST /catalogos or /catalogos.json
  def create
    @catalogo = Catalogo.new(catalogo_params)

    respond_to do |format|
      if @catalogo.save
        format.html { redirect_to catalogo_url(@catalogo), notice: "Catalogo was successfully created." }
        format.json { render :show, status: :created, location: @catalogo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @catalogo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /catalogos/1 or /catalogos/1.json
  def update
    if session[:userlog]==-1
      respond_to do |format|
        if @catalogo.update(catalogo_params)
          format.html { redirect_to vendedors_path, notice: "Fue creado el producto." }
          format.json { render :show, status: :ok, location: @catalogo }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @catalogo.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        if @catalogo.update(catalogo_params)
          format.html { redirect_to supervisors_path, notice: "Fue creado el producto." }
          format.json { render :show, status: :ok, location: @catalogo }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @catalogo.errors, status: :unprocessable_entity }
        end
      end
  end

  # DELETE /catalogos/1 or /catalogos/1.json
  def destroy
    @catalogo.destroy

    respond_to do |format|
      format.html { redirect_to catalogos_url, notice: "Catalogo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_catalogo
      @catalogo = Catalogo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def catalogo_params
      params.require(:catalogo).permit(:nombre, :codigo, :empresa, :precio, :descripcion)
    end
end
