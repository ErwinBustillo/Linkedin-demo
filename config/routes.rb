Rails.application.routes.draw do
  devise_for :personas, :controllers => { registrations: 'registrations' }
  resources :personas do
    member do
      put "agregar_amigo"
    end
  end
  resources :busquedas do
    collection do
      get "personas"
      get "trabajos"

      post "resultado_personas"
      post "resultado_trabajos"
    end
  end
  resources :ofertas
  resources :trabajos
  root to: 'paginas#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
