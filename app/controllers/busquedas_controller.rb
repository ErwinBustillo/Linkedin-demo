class BusquedasController < ApplicationController

  def personas

  end

  def trabajos

  end

  def resultado_personas
    hash = {}
    empresa = Empresa.find(params[:empresa_id]) if !params[:empresa_id].nil? && !params[:empresa_id].empty?
    hash[:carrera] = Carrera.find(params[:carrera_id]) if !params[:carrera_id].nil? && !params[:carrera_id].empty?
    hash[:semestre] = params[:semestre] if !params[:semestre].nil? && !params[:semestre].empty?
    hash[:nombre] = /#{params[:nombre].downcase}/ if !params[:nombre].nil? && !params[:nombre].empty?
    hash[:apellido] = /#{params[:apellido].downcase}/ if !params[:apellido].nil? && !params[:apellido].empty?
    if empresa
      @personas = []
      Persona.where(hash).each do |persona|
        trabajo_actual = persona.trabajos.where(fecha_fin:nil).last
        @personas << persona if trabajo_actual && trabajo_actual.empresa == empresa
      end
    else
      @personas = Persona.where(hash)
    end
  end

  def resultado_trabajos
    hash = {}
    hash[:empresa] = Empresa.find(params[:empresa_id]) if !params[:empresa_id].nil? && !params[:empresa_id].empty?
    hash[:cargo] = /#{params[:descripcion].downcase}/ if !params[:descripcion].nil? && !params[:descripcion].empty?
    @trabajos = Trabajo.where hash
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def busquedas_params
      params.permit(:keyword)
    end
end
