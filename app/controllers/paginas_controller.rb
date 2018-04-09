class PaginasController < ApplicationController
  before_action :set_pagina, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_persona! # Tell devise to use :user map
  # GET /paginas
  # GET /paginas.json
  def index

  end
end
