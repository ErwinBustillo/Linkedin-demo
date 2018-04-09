class OfertasController < ApplicationController
  before_action :set_oferta, only: [:show, :edit, :update, :destroy]

  def create
    @oferta = Oferta.new(oferta_params)
    @oferta.persona = current_persona
    @oferta.empresa = Empresa.find params[:empresa_id]
    @oferta.carrera = Carrera.find params[:carrera_id]
    respond_to do |format|
      if @oferta.save
        format.html { redirect_to root_path, notice: 'Oferta creada exitosamente' }
        #format.json { render :show, status: :created, location: @persona }
      else
        #format.html { render :new }
        #format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_oferta
      @oferta = Oferta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def oferta_params
      params.permit(:nombre_contacto, :apellido_contacto, :descripcion, :salario, :titulo, :empresa_id , :carrera_id)
    end
end
