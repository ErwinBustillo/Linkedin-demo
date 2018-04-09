class Oferta
  include Mongoid::Document
  field :nombre_contacto, type: String
  field :apellido_contacto, type: String
  field :descripcion, type: String
  field :salario, type: Integer
  field :titulo, type: String
  belongs_to :empresa ,optional: true
  belongs_to :persona ,optional: true
  belongs_to :carrera ,optional: true
end
