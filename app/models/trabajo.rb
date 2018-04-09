class Trabajo
  include Mongoid::Document
  field :cargo, type: String
  field :fecha_inicio, type:Date
  field :fecha_fin, type: Date
  belongs_to :persona ,optional: true
  belongs_to :empresa ,optional: true
end
