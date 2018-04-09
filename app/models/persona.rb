class Persona
  include Mongoid::Document
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time
  field :remember_created_at, type: Time
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  field :nombre, type: String
  field :apellido, type: String
  field :semestre, type: Integer
  field :telefono, type: String
  has_many :ofertas
  has_many :trabajos
  belongs_to :padre, class_name: 'Persona' ,optional: true
  has_many :personas
  belongs_to :carrera ,optional: true

  def sugeridos
    resultado = []
    personas.each do |amigo|

        resultado << amigo_ unless personas.include?(amigo)
        amigo.personas.each do |amigo_|
        resultado << amigo_ unless personas.include?(amigo_)
        end
      
    end
    resultado
  end

  def ofertas_interesantes
    Oferta.where(:carrera => carrera, :persona.ne => self).take 5
  end

  def cantidad_amigos
    personas.count + (padre ? 1 : 0)
  end
end
