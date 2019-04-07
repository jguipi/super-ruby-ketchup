Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :coordonateurs
  resources :educations
  resources :departements
  resources :services
  resources :locals
  resources :point_services
  resources :adresses
  resources :employes do
    get 'filter', :on => :collection
  end
  resources :referents do
    resources :telephones
  end
  resources :organismes do
    resources :point_services do
      resources :locals do
        member do
          post 'add_service_to_local'
          post 'remove_service_from_local'
        end
      end
    end
    resources :employes do

    end
  end
  resources :welcomes

  mount OrganismeTrader::Base => '/shared'
  mount EmployeTrader::Base => '/shared'

  get 'referents/index' => 'referents#index'
  get '/search' => 'referents#index'

  devise_for :users, controllers: {
      sessions: 'users/sessions',
      passwords: 'users/passwords',
      registrations: 'users/registrations'
  }

  root 'welcomes#index'
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
