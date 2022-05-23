class RpedidosController < ApplicationController
  before_action :set_rpedido, only: %i[ show edit update destroy ]

  # GET /rpedidos or /rpedidos.json
  def index
    @rpedidos = Rpedido.all
  end
  def agregar_producto
    render "new"
  end


  

  # GET /rpedidos/1 or /rpedidos/1.json
  def show
  end

  # GET /rpedidos/new
  def new
    @rpedido = Rpedido.new
  end

  # GET /rpedidos/1/edit
  def edit
  end

  # POST /rpedidos or /rpedidos.json
  def create
    @rpedido = Rpedido.new(rpedido_params)

    respond_to do |format|
      if @rpedido.save
        format.html { redirect_to rpedido_url(@rpedido), notice: "Rpedido was successfully created." }
        format.json { render :show, status: :created, location: @rpedido }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rpedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rpedidos/1 or /rpedidos/1.json
  def update
    respond_to do |format|
      if @rpedido.update(rpedido_params)
        @detalle = Detallep
        @detalle.catalogo = Catalogo.find(@producto)
        @detalle.cantidad = params[@producto]
        @detalle.save
        @rpedido.detallep.push(@detalle)
        @rpedido.save
      else
        if @producto==2
          @error1=123456789
        end
        @error1=12345678888889
        
        puts @error1
        puts @error1
        @error1= params[:pito]
        puts @error1
        puts @producto
        puts @error1
        puts @error1
        puts @error1
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rpedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rpedidos/1 or /rpedidos/1.json
  def destroy
    @rpedido.detallep.each do |det|
      det.destroy
    end
    @rpedido.destroy

    respond_to do |format|
      format.html { redirect_to catalogos_path, notice: "Rpedido was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rpedido
      @rpedido = Rpedido.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rpedido_params
      params.require(:rpedido).permit(:tiendita, :responsable, :id_producto, :cantidad )
    end
end
