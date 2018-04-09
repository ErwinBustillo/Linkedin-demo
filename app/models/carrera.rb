class Carrera
  include Mongoid::Document
  field :nombre, type: String
  has_many :personas
  has_many :ofertas
end
