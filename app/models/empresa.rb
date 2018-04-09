class Empresa
  include Mongoid::Document
  field :nombre, type: String
  field :ubicacion, type:String
  field :email, type: String
  field :telefono, type: String
  has_many :ofertas
  has_many :trabajos
end
