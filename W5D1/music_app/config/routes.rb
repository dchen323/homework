Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :new,:show]
  resource :session, only: [:create, :new,:destroy]
  resources :bands

  resources :bands, only: [:show] do
    resources :albums, only: [:new,:create]
  end
  resources :albums, except: [:index, :create]
end
