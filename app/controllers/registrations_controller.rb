class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:persona).permit(:nombre, :apellido, :email, :password, :password_confirmation, :semestre, :telefono, :carrera_id)
  end

  def account_update_params
    params.require(:persona).permit(:nombre, :apellido, :email, :password, :password_confirmation, :semestre, :telefono, :carrera_id)
  end
end
