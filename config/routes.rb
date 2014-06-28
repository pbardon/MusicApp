Rails.application.routes.draw do
  root to: "users#index"
  resources :users
  resource :session

  resources :bands do
    resources :albums, only: [:index, :new, :create]
  end


  resources :albums, only: :show do
    resources :tracks, only: [:index, :new, :create]
  end

  resources :albums, only: [:show, :destroy]

  resources :tracks, only: [:show, :destroy]
end
