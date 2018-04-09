class TrabajosController < ApplicationController
  before_action :set_trabajo, only: [:show, :edit, :update, :destroy]

  def create
    if params[:fecha_fin].nil? || params[:fecha_fin].empty?
      current_persona.trabajos.each do |trabajo|
        trabajo.fecha_fin = Time.now if !trabajo.fecha_fin
        trabajo.save!
      end
    end
    @trabajo = Trabajo.new(trabajo_params)
    @trabajo.cargo = params[:cargo].downcase
    @trabajo.persona = current_persona
    @trabajo.empresa = Empresa.find params[:empresa_id]

    respond_to do |format|
      if @trabajo.save
        format.html { redirect_to root_path, notice: 'Trabajo creada exitosamente' }
        #format.json { render :show, status: :created, location: @persona }
      else
        #format.html { render :new }
        #format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trabajo
      @trabajo = Trabajo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trabajo_params
      params.permit(:cargo, :fecha_inicio, :fecha_fin, :empresa_id)
    end
end
